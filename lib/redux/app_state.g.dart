// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final BuiltList<SortParameters> list_sort;
  @override
  final int total_vetor;
  @override
  final int total_itens;
  @override
  final BuiltList<String> selecionados;
  @override
  final String descricao;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.list_sort,
      this.total_vetor,
      this.total_itens,
      this.selecionados,
      this.descricao})
      : super._();

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        list_sort == other.list_sort &&
        total_vetor == other.total_vetor &&
        total_itens == other.total_itens &&
        selecionados == other.selecionados &&
        descricao == other.descricao;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, list_sort.hashCode), total_vetor.hashCode),
                total_itens.hashCode),
            selecionados.hashCode),
        descricao.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('list_sort', list_sort)
          ..add('total_vetor', total_vetor)
          ..add('total_itens', total_itens)
          ..add('selecionados', selecionados)
          ..add('descricao', descricao))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<SortParameters> _list_sort;
  ListBuilder<SortParameters> get list_sort =>
      _$this._list_sort ??= new ListBuilder<SortParameters>();
  set list_sort(ListBuilder<SortParameters> list_sort) =>
      _$this._list_sort = list_sort;

  int _total_vetor;
  int get total_vetor => _$this._total_vetor;
  set total_vetor(int total_vetor) => _$this._total_vetor = total_vetor;

  int _total_itens;
  int get total_itens => _$this._total_itens;
  set total_itens(int total_itens) => _$this._total_itens = total_itens;

  ListBuilder<String> _selecionados;
  ListBuilder<String> get selecionados =>
      _$this._selecionados ??= new ListBuilder<String>();
  set selecionados(ListBuilder<String> selecionados) =>
      _$this._selecionados = selecionados;

  String _descricao;
  String get descricao => _$this._descricao;
  set descricao(String descricao) => _$this._descricao = descricao;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _list_sort = _$v.list_sort?.toBuilder();
      _total_vetor = _$v.total_vetor;
      _total_itens = _$v.total_itens;
      _selecionados = _$v.selecionados?.toBuilder();
      _descricao = _$v.descricao;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              list_sort: _list_sort?.build(),
              total_vetor: total_vetor,
              total_itens: total_itens,
              selecionados: _selecionados?.build(),
              descricao: descricao);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'list_sort';
        _list_sort?.build();

        _$failedField = 'selecionados';
        _selecionados?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
