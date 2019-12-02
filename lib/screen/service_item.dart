import 'dart:async';

import 'package:aps_sort/model/sort_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ServiceItem extends StatefulWidget {
  final SortParameters item;

  const ServiceItem({Key key, this.item}) : super(key: key);

  @override
  ServiceItemState createState() => new ServiceItemState();
}

class ServiceItemState extends State<ServiceItem> {
  int counter = 0;
  bool init = false;

  @override
  void initState() {
    super.initState();
//    futureBuilder();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext contextb) {
    try {
      return new Card(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          elevation: 8.0,
          color: Color.fromRGBO(64, 75, 96, .9),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Container(
            child: makeListTile(contextb),
          ));
    } catch (e) {
      return new Container();
    }
  }

  ListTile makeListTile(BuildContext contextb) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 1.0),
        leading: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              padding: EdgeInsets.only(right: 8.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: widget.item.index_array == widget.item.total_vetor
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : SpinKitFadingGrid(
                      size: 20, color: Colors.green, shape: BoxShape.rectangle),
            )),
        title: Row(children: <Widget>[
          Text(
            widget.item.nome,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
    Text(
        ': ${widget.item.index_array.toInt()}',  style: TextStyle(color: Colors.white))
        ]),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                  height: 15,
                  child: Text(
                      'Trocas: ${widget.item.media_trocas.toInt()} Compara.: ${widget.item.media_sort.toInt()}',  style: TextStyle(color: Colors.white)), ),
              Container(
                height: 15,
                child: Text(
                    'Tempo Ord. Array: ${widget.item.tempo_execucao}',  style: TextStyle(color: Colors.white)), ),
              Container(
                height: 15,
                child: Text(
                    'Tempo Total: ${widget.item.tempo_execucao_total}',  style: TextStyle(color: Colors.white)), )

            ],

        ),
      );
}
