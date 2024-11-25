// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostWithUser _$PostWithUserFromJson(Map<String, dynamic> json) {
  return _PostWithUser.fromJson(json);
}

/// @nodoc
mixin _$PostWithUser {
  Post get post => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostWithUserCopyWith<PostWithUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostWithUserCopyWith<$Res> {
  factory $PostWithUserCopyWith(
          PostWithUser value, $Res Function(PostWithUser) then) =
      _$PostWithUserCopyWithImpl<$Res, PostWithUser>;
  @useResult
  $Res call({Post post, User user});

  $PostCopyWith<$Res> get post;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$PostWithUserCopyWithImpl<$Res, $Val extends PostWithUser>
    implements $PostWithUserCopyWith<$Res> {
  _$PostWithUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostWithUserImplCopyWith<$Res>
    implements $PostWithUserCopyWith<$Res> {
  factory _$$PostWithUserImplCopyWith(
          _$PostWithUserImpl value, $Res Function(_$PostWithUserImpl) then) =
      __$$PostWithUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Post post, User user});

  @override
  $PostCopyWith<$Res> get post;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$PostWithUserImplCopyWithImpl<$Res>
    extends _$PostWithUserCopyWithImpl<$Res, _$PostWithUserImpl>
    implements _$$PostWithUserImplCopyWith<$Res> {
  __$$PostWithUserImplCopyWithImpl(
      _$PostWithUserImpl _value, $Res Function(_$PostWithUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? user = null,
  }) {
    return _then(_$PostWithUserImpl(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostWithUserImpl implements _PostWithUser {
  const _$PostWithUserImpl({required this.post, required this.user});

  factory _$PostWithUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostWithUserImplFromJson(json);

  @override
  final Post post;
  @override
  final User user;

  @override
  String toString() {
    return 'PostWithUser(post: $post, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostWithUserImpl &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, post, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostWithUserImplCopyWith<_$PostWithUserImpl> get copyWith =>
      __$$PostWithUserImplCopyWithImpl<_$PostWithUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostWithUserImplToJson(
      this,
    );
  }
}

abstract class _PostWithUser implements PostWithUser {
  const factory _PostWithUser(
      {required final Post post,
      required final User user}) = _$PostWithUserImpl;

  factory _PostWithUser.fromJson(Map<String, dynamic> json) =
      _$PostWithUserImpl.fromJson;

  @override
  Post get post;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$PostWithUserImplCopyWith<_$PostWithUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
mixin _$HomeState {
  List<PostWithUser> get postWithUsers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({List<PostWithUser> postWithUsers});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postWithUsers = null,
  }) {
    return _then(_value.copyWith(
      postWithUsers: null == postWithUsers
          ? _value.postWithUsers
          : postWithUsers // ignore: cast_nullable_to_non_nullable
              as List<PostWithUser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PostWithUser> postWithUsers});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postWithUsers = null,
  }) {
    return _then(_$HomeStateImpl(
      postWithUsers: null == postWithUsers
          ? _value._postWithUsers
          : postWithUsers // ignore: cast_nullable_to_non_nullable
              as List<PostWithUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({required final List<PostWithUser> postWithUsers})
      : _postWithUsers = postWithUsers;

  factory _$HomeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStateImplFromJson(json);

  final List<PostWithUser> _postWithUsers;
  @override
  List<PostWithUser> get postWithUsers {
    if (_postWithUsers is EqualUnmodifiableListView) return _postWithUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postWithUsers);
  }

  @override
  String toString() {
    return 'HomeState(postWithUsers: $postWithUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._postWithUsers, _postWithUsers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_postWithUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStateImplToJson(
      this,
    );
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({required final List<PostWithUser> postWithUsers}) =
      _$HomeStateImpl;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$HomeStateImpl.fromJson;

  @override
  List<PostWithUser> get postWithUsers;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
