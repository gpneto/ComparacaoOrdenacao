import 'package:aps_sort/model/sort_parameters.dart';
import 'package:aps_sort/model/sort_viewmodel.dart';
import 'package:aps_sort/redux/app_state.dart';
import 'package:aps_sort/screen/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SortScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<AppState, SortViewModel>(
      distinct: false,
      converter: SortViewModel.fromStore,
      builder: (context, vm) {
        //Aqui retorna uma Lista com todos os contadores

        List<Widget> lista = [];

        List<SortParameters> lista_sort = vm.list_sort.toList();

        if (lista_sort.length > 0) {
          lista.add(Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (Container(
//                    width: 320.0,
                height: 40.0,
                alignment: FractionalOffset.center,
                decoration: new BoxDecoration(
                  color: const Color.fromRGBO(63, 185, 59, 1.0),
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(3.0, 5.0),
                        blurRadius: 7),
                  ],
                ),
                child: new Text(
                  "Resultado",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
              )),
            ),
          ));
        }

        lista_sort.sort((a, b) {
          return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
        });
        for (SortParameters item in lista_sort) {

          lista.add(ServiceItem(
            item: item,
          ));
        }

        return Container(
          child: Column(children: lista),
        );
      },
    );
  }
}
