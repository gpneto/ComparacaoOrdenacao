import 'package:aps_sort/model/grafico_viewmodel.dart';
import 'package:aps_sort/model/sort_parameters.dart';
import 'package:aps_sort/model/sort_viewmodel.dart';

import 'package:aps_sort/redux/app_state.dart';
import 'package:aps_sort/screen/grafico_media.dart';

/// Line chart with line annotations example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GradicoMediaComparacoes extends StatelessWidget {


  GradicoMediaComparacoes({Key key}) : super(key: key);

  int listaSelectionIndex = -1;
  int listaBubbleIndex = -1;

  bool finalizado = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SortViewModel>(
      distinct: false,
      converter: SortViewModel.fromStore,
      builder: (context, vm) {
        return new charts.BarChart(
          _createSampleData(vm),
          animate: false,
          barRendererDecorator: new charts.BarLabelDecorator<String>(),
//          domainAxis: new charts.OrdinalAxisSpec(),
          domainAxis: new charts.OrdinalAxisSpec(
            viewport: new charts.OrdinalViewport('Grafico', 4),
          ),
//
          behaviors: [
            new charts.SeriesLegend(),
            new charts.SlidingViewport(),
            new charts.PanAndZoomBehavior(),
//            new charts.Labe

          ],
        );
      },
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData(
      SortViewModel vm) {


    final List<OrdinalSales> data = [];


    List lista_sort = vm.list_sort.toList();

    lista_sort.sort((a, b) {
      return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
    });

    for (SortParameters item in lista_sort) {
      data.add(OrdinalSales(item.nome, item.media_sort.toInt()));
    }

    return  [charts.Series<OrdinalSales, String>(
      id: "Grafico Média de Comparacoes",
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: data,
      labelAccessorFn: (OrdinalSales sales, _) => '${sales.sales.toString()}',


    )];
  }
}