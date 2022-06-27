// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
// 식별자
  String? get id => throw _privateConstructorUsedError; // 사용자 식별
  String get userId => throw _privateConstructorUsedError; // 미디어 식별
  String get mediaId => throw _privateConstructorUsedError; // 미디어 제목
  String get mediaTitle => throw _privateConstructorUsedError; // 미디어 이미지
  String get mediaBanner => throw _privateConstructorUsedError; // 추가한 날짜
  DateTime? get addedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String userId,
      String mediaId,
      String mediaTitle,
      String mediaBanner,
      DateTime? addedAt});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res> implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  final Favorite _value;
  // ignore: unused_field
  final $Res Function(Favorite) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? mediaId = freezed,
    Object? mediaTitle = freezed,
    Object? mediaBanner = freezed,
    Object? addedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaTitle: mediaTitle == freezed
          ? _value.mediaTitle
          : mediaTitle // ignore: cast_nullable_to_non_nullable
              as String,
      mediaBanner: mediaBanner == freezed
          ? _value.mediaBanner
          : mediaBanner // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: addedAt == freezed
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$$_FavoriteCopyWith(
          _$_Favorite value, $Res Function(_$_Favorite) then) =
      __$$_FavoriteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String userId,
      String mediaId,
      String mediaTitle,
      String mediaBanner,
      DateTime? addedAt});
}

/// @nodoc
class __$$_FavoriteCopyWithImpl<$Res> extends _$FavoriteCopyWithImpl<$Res>
    implements _$$_FavoriteCopyWith<$Res> {
  __$$_FavoriteCopyWithImpl(
      _$_Favorite _value, $Res Function(_$_Favorite) _then)
      : super(_value, (v) => _then(v as _$_Favorite));

  @override
  _$_Favorite get _value => super._value as _$_Favorite;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? mediaId = freezed,
    Object? mediaTitle = freezed,
    Object? mediaBanner = freezed,
    Object? addedAt = freezed,
  }) {
    return _then(_$_Favorite(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaTitle: mediaTitle == freezed
          ? _value.mediaTitle
          : mediaTitle // ignore: cast_nullable_to_non_nullable
              as String,
      mediaBanner: mediaBanner == freezed
          ? _value.mediaBanner
          : mediaBanner // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: addedAt == freezed
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favorite implements _Favorite {
  const _$_Favorite(
      {this.id,
      required this.userId,
      required this.mediaId,
      required this.mediaTitle,
      required this.mediaBanner,
      this.addedAt});

  factory _$_Favorite.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteFromJson(json);

// 식별자
  @override
  final String? id;
// 사용자 식별
  @override
  final String userId;
// 미디어 식별
  @override
  final String mediaId;
// 미디어 제목
  @override
  final String mediaTitle;
// 미디어 이미지
  @override
  final String mediaBanner;
// 추가한 날짜
  @override
  final DateTime? addedAt;

  @override
  String toString() {
    return 'Favorite(id: $id, userId: $userId, mediaId: $mediaId, mediaTitle: $mediaTitle, mediaBanner: $mediaBanner, addedAt: $addedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favorite &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.mediaId, mediaId) &&
            const DeepCollectionEquality()
                .equals(other.mediaTitle, mediaTitle) &&
            const DeepCollectionEquality()
                .equals(other.mediaBanner, mediaBanner) &&
            const DeepCollectionEquality().equals(other.addedAt, addedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(mediaId),
      const DeepCollectionEquality().hash(mediaTitle),
      const DeepCollectionEquality().hash(mediaBanner),
      const DeepCollectionEquality().hash(addedAt));

  @JsonKey(ignore: true)
  @override
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      __$$_FavoriteCopyWithImpl<_$_Favorite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteToJson(this);
  }
}

abstract class _Favorite implements Favorite {
  const factory _Favorite(
      {final String? id,
      required final String userId,
      required final String mediaId,
      required final String mediaTitle,
      required final String mediaBanner,
      final DateTime? addedAt}) = _$_Favorite;

  factory _Favorite.fromJson(Map<String, dynamic> json) = _$_Favorite.fromJson;

  @override // 식별자
  String? get id => throw _privateConstructorUsedError;
  @override // 사용자 식별
  String get userId => throw _privateConstructorUsedError;
  @override // 미디어 식별
  String get mediaId => throw _privateConstructorUsedError;
  @override // 미디어 제목
  String get mediaTitle => throw _privateConstructorUsedError;
  @override // 미디어 이미지
  String get mediaBanner => throw _privateConstructorUsedError;
  @override // 추가한 날짜
  DateTime? get addedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}
