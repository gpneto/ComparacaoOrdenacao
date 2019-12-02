import 'package:aps_sort/model/sort_parameters.dart';
import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";


part 'app_state.g.dart';


abstract class AppState implements Built<AppState, AppStateBuilder> {


  @nullable
  BuiltList<SortParameters> get list_sort;


  @nullable
  int get total_vetor;

  @nullable
  int  get total_itens;

  @nullable
  BuiltList<String> get selecionados;

  @nullable
  String get descricao;


  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.init() => AppState((a) => a..list_sort = ListBuilder());


}