import 'dart:isolate';
import 'dart:math';

import 'package:aps_sort/model/sort_parameters.dart';
import 'package:aps_sort/redux/app_actions.dart';
import 'package:aps_sort/redux/app_state.dart';
import 'package:aps_sort/screen/grafico_media.dart';


import "package:redux/redux.dart";

import '../algoritimos.dart';

/// Middleware is used for a variety of things.
/// Including:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createStoreMiddleware() {
  return [TypedMiddleware<AppState, InitSort>(_initBubbleSort())];
}

// Receives updates for the logged in user.
void Function(
  Store<AppState> store,
  InitSort action,
  NextDispatcher next,
) _initBubbleSort() {
  return (store, action, next) async {
    next(action);

    var ourFirstReceivePort = new ReceivePort();
    await Isolate.spawn(_createArray, ourFirstReceivePort.sendPort);
    var echoPort = await ourFirstReceivePort.first;
    var ourSecondReceivePort = ReceivePort();
    echoPort.send([
      ourSecondReceivePort.sendPort,
      action.total_vetor,
      action.total_itens
    ]);

    List vetores = await ourSecondReceivePort.first;
    ourFirstReceivePort.close();
    ourSecondReceivePort.close();

    if (action.tipos.contains("BubbleSort")) {
      SortParameters BubbleSortP =
          SortParameters.init("BubbleSort", action.total_vetor);
      store.dispatch(UpdateMediaSort(BubbleSortP));
      _iniciaThreadSort(vetores, store, BubbleSortP, bubbleSort);
    }

    if (action.tipos.contains("SelectionSort")) {
      SortParameters SelectionSortP =
          SortParameters.init("SelectionSort", action.total_vetor);
      store.dispatch(UpdateMediaSort(SelectionSortP));
      _iniciaThreadSort(vetores, store, SelectionSortP, selectionSort);
    }

    if (action.tipos.contains("InsertionSort")) {
      SortParameters insertionSortP =
          SortParameters.init("InsertionSort", action.total_vetor);
      store.dispatch(UpdateMediaSort(insertionSortP));
      _iniciaThreadSort(vetores, store, insertionSortP, insertionSort);
    }


    if (action.tipos.contains("HeapSort")) {
      SortParameters heapSortP =
          SortParameters.init("HeapSort", action.total_vetor);
      store.dispatch(UpdateMediaSort(heapSortP));
      _iniciaThreadSort(vetores, store, heapSortP, heapSort);
    }

    if (action.tipos.contains("QuickSort")) {
      SortParameters quickSortP =
          SortParameters.init("QuickSort", action.total_vetor);
      store.dispatch(UpdateMediaSort(quickSortP));
      _iniciaThreadSort(vetores, store, quickSortP, quickSort);
    }

    if (action.tipos.contains("MergeSort")) {
      SortParameters mergeSortP =
          SortParameters.init("MergeSort", action.total_vetor);
      store.dispatch(UpdateMediaSort(mergeSortP));
      _iniciaThreadSort(vetores, store, mergeSortP, mergeSort);
    }
  };
}

_createArray(SendPort sendPort) async {
  var ourReceivePort = ReceivePort();

  sendPort.send(ourReceivePort.sendPort);

  await for (var msg in ourReceivePort) {
    SendPort replyToPort = msg[0];
    int total_vetor = msg[1];
    int total_itens = msg[2];

    List vetores = List(total_vetor);

    for (var i = 0; i < total_vetor; i++) {
      List<num> vetor = List(total_itens);

      var rng = new Random();
      for (var j = 0; j < total_itens; j++) {
        vetor[j] = rng.nextInt(10000000);
      }

      vetores[i] = vetor;
    }

    replyToPort.send(vetores);
  }
}

_iniciaThreadSort(List lista, Store<AppState> store,
    SortParameters sortParameters, Function f) async {
  //Faz uma Cópia do Vetor para usar nos outroz métodos

  store.dispatch(UpdateDescricao("Copiando o array"));

  List<List<num>> vetores = List(lista.length);
  for (var i = 0; i < vetores.length; i++) {
    store.dispatch(UpdateDescricao("Copiando o array: ${i + 1}"));
    vetores[i] = List.from(lista[i]);
  }

  var ourFirstReceivePort = new ReceivePort();

  await Isolate.spawn(_sort, ourFirstReceivePort.sendPort);

  var echoPort = await ourFirstReceivePort.first;

  var ourSecondReceivePort = ReceivePort();
  echoPort.send([vetores, ourSecondReceivePort.sendPort, f]);
  print('IndexArray;tempo');
  ourSecondReceivePort.listen((sortParametersRetorno) {


    sortParameters.media_sort = sortParametersRetorno.total_interacoes_todos / sortParametersRetorno.index_array;
    sortParameters.index_array = sortParametersRetorno.index_array;
    sortParameters.tempo_execucao = sortParametersRetorno.tempo_execucao;
    sortParameters.tempo_execucao_total = sortParametersRetorno.tempo_execucao_total;
    sortParameters.media_trocas = sortParametersRetorno.total_trocas_todos / sortParametersRetorno.index_array;


    print('${sortParametersRetorno.index_array};${sortParametersRetorno.tempo_execucao}');

    store.dispatch(UpdateMediaSort(sortParameters));

    if (sortParametersRetorno.index_array == vetores.length) {
      ourFirstReceivePort.close();
      ourSecondReceivePort.close();
      vetores = null;
    }
  });
}

_sort(SendPort sendPort) async {
  var ourReceivePort = ReceivePort();

  sendPort.send(ourReceivePort.sendPort);

  await for (var msg in ourReceivePort) {
    SendPort replyToPort = msg[1];
    List retList = msg[0];
    Function funcao_que_ordena = msg[2];
    num media_interacoes = 0;
    num media_trocas = 0;

    Stopwatch stopwatchTotal = Stopwatch()..start();
    //Realiza a Ordenacao de Todos os Vetores
    for (var i = 0; i < retList.length; i++) {
      SortParameters sortParameters =  SortParameters();
      Stopwatch stopwatch = Stopwatch()..start();
      List retorno = funcao_que_ordena(retList[i]);
      sortParameters.tempo_execucao = stopwatch.elapsed;

      media_interacoes += retorno[1];
      media_trocas += retorno[2];


      sortParameters.total_interacoes_todos = media_interacoes;
      sortParameters.total_trocas_todos = media_trocas;
      sortParameters.index_array = i + 1;

      sortParameters.total_interacoes_do_array = retorno[1];
      sortParameters.total_trocas_do_array = retorno[2];
      sortParameters.tempo_execucao_total = stopwatchTotal.elapsed;
      replyToPort.send(sortParameters);
    }
//    print('doSomething() executed in ${stopwatch.elapsed}');
  }
}
