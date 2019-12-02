

import "dart:async";

import 'package:aps_sort/model/sort_parameters.dart';
import 'package:aps_sort/redux/app_state.dart';
import 'package:built_collection/built_collection.dart';
import "package:built_value/built_value.dart";
import "package:redux/redux.dart";

// ignore: prefer_double_quotes
part 'sort_viewmodel.g.dart';

abstract class SortViewModel
    implements Built<SortViewModel, SortViewModelBuilder> {


  @nullable
  BuiltList<SortParameters> get list_sort;

  @nullable
  String get descricao;


SortViewModel._();

  factory SortViewModel(
      [void Function(SortViewModelBuilder) updates]) =
  _$SortViewModel;



  static SortViewModel fromStore(Store<AppState> store) {

      return SortViewModel((vm) => vm
        ..list_sort = ListBuilder(store.state.list_sort)
      ..descricao = store.state.descricao);


  }
}
