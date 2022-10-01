// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuizModel> _$quizModelSerializer = new _$QuizModelSerializer();

class _$QuizModelSerializer implements StructuredSerializer<QuizModel> {
  @override
  final Iterable<Type> types = const [QuizModel, _$QuizModel];
  @override
  final String wireName = 'QuizModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuizModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'questions',
      serializers.serialize(object.questions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  QuizModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'questions':
          result.questions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$QuizModel extends QuizModel {
  @override
  final String name;
  @override
  final BuiltList<String> questions;

  factory _$QuizModel([void Function(QuizModelBuilder)? updates]) =>
      (new QuizModelBuilder()..update(updates))._build();

  _$QuizModel._({required this.name, required this.questions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'QuizModel', 'name');
    BuiltValueNullFieldError.checkNotNull(questions, r'QuizModel', 'questions');
  }

  @override
  QuizModel rebuild(void Function(QuizModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizModelBuilder toBuilder() => new QuizModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizModel &&
        name == other.name &&
        questions == other.questions;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), questions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuizModel')
          ..add('name', name)
          ..add('questions', questions))
        .toString();
  }
}

class QuizModelBuilder implements Builder<QuizModel, QuizModelBuilder> {
  _$QuizModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _questions;
  ListBuilder<String> get questions =>
      _$this._questions ??= new ListBuilder<String>();
  set questions(ListBuilder<String>? questions) =>
      _$this._questions = questions;

  QuizModelBuilder();

  QuizModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _questions = $v.questions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizModel;
  }

  @override
  void update(void Function(QuizModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuizModel build() => _build();

  _$QuizModel _build() {
    _$QuizModel _$result;
    try {
      _$result = _$v ??
          new _$QuizModel._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'QuizModel', 'name'),
              questions: questions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QuizModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
