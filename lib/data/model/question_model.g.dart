// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionModel> _$questionModelSerializer =
    new _$QuestionModelSerializer();

class _$QuestionModelSerializer implements StructuredSerializer<QuestionModel> {
  @override
  final Iterable<Type> types = const [QuestionModel, _$QuestionModel];
  @override
  final String wireName = 'QuestionModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuestionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'answers',
      serializers.serialize(object.answers,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(String)])),
    ];

    return result;
  }

  @override
  QuestionModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(String)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionModel extends QuestionModel {
  @override
  final String text;
  @override
  final String id;
  @override
  final BuiltMap<String, String> answers;

  factory _$QuestionModel([void Function(QuestionModelBuilder)? updates]) =>
      (new QuestionModelBuilder()..update(updates))._build();

  _$QuestionModel._(
      {required this.text, required this.id, required this.answers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(text, r'QuestionModel', 'text');
    BuiltValueNullFieldError.checkNotNull(id, r'QuestionModel', 'id');
    BuiltValueNullFieldError.checkNotNull(answers, r'QuestionModel', 'answers');
  }

  @override
  QuestionModel rebuild(void Function(QuestionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionModelBuilder toBuilder() => new QuestionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionModel &&
        text == other.text &&
        id == other.id &&
        answers == other.answers;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, text.hashCode), id.hashCode), answers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuestionModel')
          ..add('text', text)
          ..add('id', id)
          ..add('answers', answers))
        .toString();
  }
}

class QuestionModelBuilder
    implements Builder<QuestionModel, QuestionModelBuilder> {
  _$QuestionModel? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  MapBuilder<String, String>? _answers;
  MapBuilder<String, String> get answers =>
      _$this._answers ??= new MapBuilder<String, String>();
  set answers(MapBuilder<String, String>? answers) => _$this._answers = answers;

  QuestionModelBuilder();

  QuestionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _id = $v.id;
      _answers = $v.answers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionModel;
  }

  @override
  void update(void Function(QuestionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestionModel build() => _build();

  _$QuestionModel _build() {
    _$QuestionModel _$result;
    try {
      _$result = _$v ??
          new _$QuestionModel._(
              text: BuiltValueNullFieldError.checkNotNull(
                  text, r'QuestionModel', 'text'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'QuestionModel', 'id'),
              answers: answers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'answers';
        answers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'QuestionModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
