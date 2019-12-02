// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grafico_viewmodel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GraficoViewModel extends GraficoViewModel {
  @override
  final num media_bubbleSort;
  @override
  final num media_selectionSort;

  factory _$GraficoViewModel(
          [void Function(GraficoViewModelBuilder) updates]) =>
      (new GraficoViewModelBuilder()..update(updates)).build();

  _$GraficoViewModel._({this.media_bubbleSort, this.media_selectionSort})
      : super._();

  @override
  GraficoViewModel rebuild(void Function(GraficoViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GraficoViewModelBuilder toBuilder() =>
      new GraficoViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GraficoViewModel &&
        media_bubbleSort == other.media_bubbleSort &&
        media_selectionSort == other.media_selectionSort;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, media_bubbleSort.hashCode), media_selectionSort.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GraficoViewModel')
          ..add('media_bubbleSort', media_bubbleSort)
          ..add('media_selectionSort', media_selectionSort))
        .toString();
  }
}

class GraficoViewModelBuilder
    implements Builder<GraficoViewModel, GraficoViewModelBuilder> {
  _$GraficoViewModel _$v;

  num _media_bubbleSort;
  num get media_bubbleSort => _$this._media_bubbleSort;
  set media_bubbleSort(num media_bubbleSort) =>
      _$this._media_bubbleSort = media_bubbleSort;

  num _media_selectionSort;
  num get media_selectionSort => _$this._media_selectionSort;
  set media_selectionSort(num media_selectionSort) =>
      _$this._media_selectionSort = media_selectionSort;

  GraficoViewModelBuilder();

  GraficoViewModelBuilder get _$this {
    if (_$v != null) {
      _media_bubbleSort = _$v.media_bubbleSort;
      _media_selectionSort = _$v.media_selectionSort;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GraficoViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GraficoViewModel;
  }

  @override
  void update(void Function(GraficoViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GraficoViewModel build() {
    final _$result = _$v ??
        new _$GraficoViewModel._(
            media_bubbleSort: media_bubbleSort,
            media_selectionSort: media_selectionSort);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
