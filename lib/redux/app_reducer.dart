import 'package:aps_sort/redux/app_actions.dart';
import "package:built_collection/built_collection.dart";

import "package:redux/redux.dart";

import 'app_state.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
///
final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, UpdateMediaSort>(_updateMediaSort),
  TypedReducer<AppState, InitSort>(_updateInitSort),
  TypedReducer<AppState, UpdateDescricao>(_updateDescricao),
  TypedReducer<AppState, CleanState>(_cleanState)
]);



AppState _cleanState(AppState state, CleanState action) {
  return state.rebuild((a) => a..list_sort =  ListBuilder());
}



AppState _updateDescricao(AppState state, UpdateDescricao action) {
  return state.rebuild((a) => a
    ..descricao = action.descricao);
}


AppState _updateMediaSort(AppState state, UpdateMediaSort action) {
  return state.rebuild((a) => a
    ..list_sort.removeWhere((u) => u.nome == action.sortParameters.nome)
    ..list_sort.add(action.sortParameters));
}

AppState _updateInitSort(AppState state, InitSort action) {
  return state.rebuild((a) => a
    ..total_vetor = action.total_vetor
    ..total_itens = action.total_itens
    ..selecionados = ListBuilder<String>(action.tipos));
}
