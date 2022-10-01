// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QuizEntity extends QuizEntity {
  @override
  final String name;
  @override
  final BuiltList<QuestionModel> questions;

  factory _$QuizEntity([void Function(QuizEntityBuilder)? updates]) =>
      (new QuizEntityBuilder()..update(updates))._build();

  _$QuizEntity._({required this.name, required this.questions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'QuizEntity', 'name');
    BuiltValueNullFieldError.checkNotNull(
        questions, r'QuizEntity', 'questions');
  }

  @override
  QuizEntity rebuild(void Function(QuizEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizEntityBuilder toBuilder() => new QuizEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizEntity &&
        name == other.name &&
        questions == other.questions;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), questions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuizEntity')
          ..add('name', name)
          ..add('questions', questions))
        .toString();
  }
}

class QuizEntityBuilder implements Builder<QuizEntity, QuizEntityBuilder> {
  _$QuizEntity? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<QuestionModel>? _questions;
  ListBuilder<QuestionModel> get questions =>
      _$this._questions ??= new ListBuilder<QuestionModel>();
  set questions(ListBuilder<QuestionModel>? questions) =>
      _$this._questions = questions;

  QuizEntityBuilder();

  QuizEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _questions = $v.questions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizEntity;
  }

  @override
  void update(void Function(QuizEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuizEntity build() => _build();

  _$QuizEntity _build() {
    _$QuizEntity _$result;
    try {
      _$result = _$v ??
          new _$QuizEntity._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'QuizEntity', 'name'),
              questions: questions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QuizEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
