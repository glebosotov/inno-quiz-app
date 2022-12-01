// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResultModel> _$resultModelSerializer = new _$ResultModelSerializer();

class _$ResultModelSerializer implements StructuredSerializer<ResultModel> {
  @override
  final Iterable<Type> types = const [ResultModel, _$ResultModel];
  @override
  final String wireName = 'ResultModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResultModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'quizId',
      serializers.serialize(object.quizId,
          specifiedType: const FullType(String)),
      'answers',
      serializers.serialize(object.answers,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(String)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.inviteId;
    if (value != null) {
      result
        ..add('inviteId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ResultModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResultModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'quizId':
          result.quizId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(String)]))!);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'inviteId':
          result.inviteId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResultModel extends ResultModel {
  @override
  final String username;
  @override
  final String quizId;
  @override
  final BuiltMap<String, String> answers;
  @override
  final String? id;
  @override
  final String? inviteId;

  factory _$ResultModel([void Function(ResultModelBuilder)? updates]) =>
      (new ResultModelBuilder()..update(updates))._build();

  _$ResultModel._(
      {required this.username,
      required this.quizId,
      required this.answers,
      this.id,
      this.inviteId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(username, r'ResultModel', 'username');
    BuiltValueNullFieldError.checkNotNull(quizId, r'ResultModel', 'quizId');
    BuiltValueNullFieldError.checkNotNull(answers, r'ResultModel', 'answers');
  }

  @override
  ResultModel rebuild(void Function(ResultModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultModelBuilder toBuilder() => new ResultModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResultModel &&
        username == other.username &&
        quizId == other.quizId &&
        answers == other.answers &&
        id == other.id &&
        inviteId == other.inviteId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, username.hashCode), quizId.hashCode),
                answers.hashCode),
            id.hashCode),
        inviteId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResultModel')
          ..add('username', username)
          ..add('quizId', quizId)
          ..add('answers', answers)
          ..add('id', id)
          ..add('inviteId', inviteId))
        .toString();
  }
}

class ResultModelBuilder implements Builder<ResultModel, ResultModelBuilder> {
  _$ResultModel? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _quizId;
  String? get quizId => _$this._quizId;
  set quizId(String? quizId) => _$this._quizId = quizId;

  MapBuilder<String, String>? _answers;
  MapBuilder<String, String> get answers =>
      _$this._answers ??= new MapBuilder<String, String>();
  set answers(MapBuilder<String, String>? answers) => _$this._answers = answers;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _inviteId;
  String? get inviteId => _$this._inviteId;
  set inviteId(String? inviteId) => _$this._inviteId = inviteId;

  ResultModelBuilder();

  ResultModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _quizId = $v.quizId;
      _answers = $v.answers.toBuilder();
      _id = $v.id;
      _inviteId = $v.inviteId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResultModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResultModel;
  }

  @override
  void update(void Function(ResultModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResultModel build() => _build();

  _$ResultModel _build() {
    _$ResultModel _$result;
    try {
      _$result = _$v ??
          new _$ResultModel._(
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'ResultModel', 'username'),
              quizId: BuiltValueNullFieldError.checkNotNull(
                  quizId, r'ResultModel', 'quizId'),
              answers: answers.build(),
              id: id,
              inviteId: inviteId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'answers';
        answers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResultModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
