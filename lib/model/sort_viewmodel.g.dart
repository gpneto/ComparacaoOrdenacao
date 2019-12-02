// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_viewmodel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SortViewModel extends SortViewModel {
  @override
  final BuiltList<SortParameters> list_sort;
  @override
  final String descricao;

  factory _$SortViewModel([void Function(SortViewModelBuilder) updates]) =>
      (new SortViewModelBuilder()..update(updates)).build();

  _$SortViewModel._({this.list_sort, this.descricao}) : super._();

  @override
  SortViewModel rebuild(void Function(SortViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SortViewModelBuilder toBuilder() => new SortViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SortViewModel &&
        list_sort == other.list_sort &&
        descricao == other.descricao;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, list_sort.hashCode), descricao.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SortViewModel')
          ..add('list_sort', list_sort)
          ..add('descricao', descricao))
        .toString();
  }
}

class SortViewModelBuilder
    implements Builder<SortViewModel, SortViewModelBuilder> {
  _$SortViewModel _$v;

  ListBuilder<SortParameters> _list_sort;
  ListBuilder<SortParameters> get list_sort =>
      _$this._list_sort ??= new ListBuilder<SortParameters>();
  set list_sort(ListBuilder<SortParameters> list_sort) =>
      _$this._list_sort = list_sort;

  String _descricao;
  String get descricao => _$this._descricao;
  set descricao(String descricao) => _$this._descricao = descricao;

  SortViewModelBuilder();

  SortViewModelBuilder get _$this {
    if (_$v != null) {
      _list_sort = _$v.list_sort?.toBuilder();
      _descricao = _$v.descricao;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SortViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SortViewModel;
  }

  @override
  void update(void Function(SortViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SortViewModel build() {
    _$SortViewModel _$result;
    try {
      _$result = _$v ??
          new _$SortViewModel._(
              list_sort: _list_sort?.build(), descricao: descricao);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'list_sort';
        _list_sort?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SortViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
