import 'dart:math';


import 'package:aps_sort/redux/app_actions.dart';
import 'package:aps_sort/redux/app_state.dart';


import 'package:aps_sort/screen/grafico_media.dart';
import 'package:aps_sort/screen/grafico_media_comparacoes.dart';
import 'package:aps_sort/screen/sort_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePageSort extends StatefulWidget {
  HomePageSort({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageSortState createState() => _HomePageSortState();
}

class _HomePageSortState extends State<HomePageSort> {
  TextEditingController controllerVetor;
  TextEditingController controllerNumeros;

  List vetores;
  List<String> selecionados = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerVetor = TextEditingController();
    controllerNumeros = TextEditingController();

    //Gera os Arrays
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (StoreProvider.of<AppState>(context).state.total_vetor != null) {
      controllerVetor.text =
          StoreProvider.of<AppState>(context).state.total_vetor.toString();
    }

    if (StoreProvider.of<AppState>(context).state.total_itens != null) {
      controllerNumeros.text =
          StoreProvider.of<AppState>(context).state.total_itens.toString();
    }
    if (StoreProvider.of<AppState>(context).state.selecionados != null) {
      selecionados = StoreProvider.of<AppState>(context).state.selecionados.toList();
    }

  }

  void _incrementCounter() async {

    StoreProvider.of<AppState>(context).dispatch(CleanState());

    int totalVetores = int.parse(controllerVetor.value.text);
    int totalNumeros = int.parse(controllerNumeros.value.text);

    StoreProvider.of<AppState>(context).dispatch(InitSort(
        total_itens: totalNumeros,
        total_vetor: totalVetores,
        tipos: selecionados ));
  }

  List<String> text = [
    "BubbleSort",
    "SelectionSort",
    "InsertionSort",
    "HeapSort",
    "QuickSort",
    "MergeSort"
  ];

  @override
  Widget build(BuildContext context) {
    text.sort((a, b) => a.compareTo(b));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        child: ListView(
          children: <Widget>[
            TextField(
              controller: controllerVetor,
              keyboardType: TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(
                  labelText: "Quantidade de Vetores",
                  border: InputBorder.none,
                  hintText: 'Quantidade de Vetores'),
            ),
            TextField(
              controller: controllerNumeros,
              keyboardType: TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(
                  labelText: "Quantidade de Números em Cada Vetor",
                  border: InputBorder.none,
                  hintText: 'Quantidade de Números em Cada Vetor'),
            ),

            Container(
              height: 350.0,
              child: Column(
                children: text
                    .map((t) => CheckboxListTile(
                          title: Text(t),
                          value: selecionados.contains(t),
                          onChanged: (val) {
                            setState(() {
                              if (val == true) {
                                selecionados.add(t);
                              } else {
                                selecionados.remove(t);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
            ),

            InkWell(
                onTap: () {
                  _incrementCounter();
                },
                child: Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (Container(
//                    width: 320.0,
                      height: 40.0,
                      alignment: FractionalOffset.center,
                      decoration: new BoxDecoration(
                        color:  Colors.blueAccent,
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(30.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(3.0, 5.0),
                              blurRadius: 7),
                        ],
                      ),
                      child: new Text(
                        "Iniciar",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.3,
                        ),
                      ),
                    )),
                  ),
                )),

        SizedBox(
          height: 20,
        ),

            SortScrean(),
//            Container(child: LineLineAnnotationChart(animate: true), height: 300,)
            Container(
              child: GraficoMediaChart(),
              height: 300
            ),
            Container(
                child: GradicoMediaComparacoes(),
                height: 300
            )
          ],
        ),
      ),
    );
  }
}
