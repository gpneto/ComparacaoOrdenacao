

import "dart:async";

import 'package:aps_sort/redux/app_state.dart';
import 'package:aps_sort/screen/grafico_media.dart';

import 'package:built_collection/built_collection.dart';
import "package:built_value/built_value.dart";
import "package:redux/redux.dart";

// ignore: prefer_double_quotes
part 'grafico_viewmodel.g.dart';

abstract class GraficoViewModel
    implements Built<GraficoViewModel, GraficoViewModelBuilder> {


  @nullable
  num get media_bubbleSort;

  @nullable
  num get media_selectionSort;




  GraficoViewModel._();

  factory GraficoViewModel(
      [void Function(GraficoViewModelBuilder) updates]) =
  _$GraficoViewModel;



  static GraficoViewModel fromStore(Store<AppState> store) {


//      return GraficoViewModel((vm) => vm
//        ..media_bubbleSort = store.state.media_bubbleSort == null ? 0 : store.state.media_bubbleSort
//        ..media_selectionSort = store.state.media_selectionSort == null ? 0 :  store.state.media_selectionSort
//      ..listaBubble = ListBuilder(store.state.listaBubble)
//      ..listaSelection = ListBuilder(store.state.listaSelection));


  }
}
