// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
// 식별자
  String get id => throw _privateConstructorUsedError; // 미디어 타입
  MediaType get type => throw _privateConstructorUsedError; // 미디어 상태
  MediaStatus get status => throw _privateConstructorUsedError; // 태그 및 관련 정보
  List<String?> get keywords => throw _privateConstructorUsedError; // 미디어 제목
  String get title => throw _privateConstructorUsedError; // 미디어 개요
  String? get synopsis => throw _privateConstructorUsedError; // 배너 이미지
  String get bannerImage => throw _privateConstructorUsedError; // 미리보기 영상
  String? get trailer => throw _privateConstructorUsedError; // 시작 날짜
  DateTime? get startDate => throw _privateConstructorUsedError; // 종료 날짜
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res>;
  $Res call(
      {String id,
      MediaType type,
      MediaStatus status,
      List<String?> keywords,
      String title,
      String? synopsis,
      String bannerImage,
      String? trailer,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res> implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  final Media _value;
  // ignore: unused_field
  final $Res Function(Media) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? keywords = freezed,
    Object? title = freezed,
    Object? synopsis = freezed,
    Object? bannerImage = freezed,
    Object? trailer = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaStatus,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: synopsis == freezed
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerImage: bannerImage == freezed
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      trailer: trailer == freezed
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$_MediaCopyWith(_$_Media value, $Res Function(_$_Media) then) =
      __$$_MediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      MediaType type,
      MediaStatus status,
      List<String?> keywords,
      String title,
      String? synopsis,
      String bannerImage,
      String? trailer,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class __$$_MediaCopyWithImpl<$Res> extends _$MediaCopyWithImpl<$Res>
    implements _$$_MediaCopyWith<$Res> {
  __$$_MediaCopyWithImpl(_$_Media _value, $Res Function(_$_Media) _then)
      : super(_value, (v) => _then(v as _$_Media));

  @override
  _$_Media get _value => super._value as _$_Media;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? keywords = freezed,
    Object? title = freezed,
    Object? synopsis = freezed,
    Object? bannerImage = freezed,
    Object? trailer = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_Media(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaStatus,
      keywords: keywords == freezed
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: synopsis == freezed
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerImage: bannerImage == freezed
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String,
      trailer: trailer == freezed
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Media implements _Media {
  const _$_Media(
      {required this.id,
      required this.type,
      required this.status,
      required final List<String?> keywords,
      required this.title,
      this.synopsis,
      required this.bannerImage,
      this.trailer,
      this.startDate,
      this.endDate})
      : _keywords = keywords;

  factory _$_Media.fromJson(Map<String, dynamic> json) =>
      _$$_MediaFromJson(json);

// 식별자
  @override
  final String id;
// 미디어 타입
  @override
  final MediaType type;
// 미디어 상태
  @override
  final MediaStatus status;
// 태그 및 관련 정보
  final List<String?> _keywords;
// 태그 및 관련 정보
  @override
  List<String?> get keywords {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

// 미디어 제목
  @override
  final String title;
// 미디어 개요
  @override
  final String? synopsis;
// 배너 이미지
  @override
  final String bannerImage;
// 미리보기 영상
  @override
  final String? trailer;
// 시작 날짜
  @override
  final DateTime? startDate;
// 종료 날짜
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'Media(id: $id, type: $type, status: $status, keywords: $keywords, title: $title, synopsis: $synopsis, bannerImage: $bannerImage, trailer: $trailer, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Media &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.synopsis, synopsis) &&
            const DeepCollectionEquality()
                .equals(other.bannerImage, bannerImage) &&
            const DeepCollectionEquality().equals(other.trailer, trailer) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_keywords),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(synopsis),
      const DeepCollectionEquality().hash(bannerImage),
      const DeepCollectionEquality().hash(trailer),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate));

  @JsonKey(ignore: true)
  @override
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      __$$_MediaCopyWithImpl<_$_Media>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaToJson(this);
  }
}

abstract class _Media implements Media {
  const factory _Media(
      {required final String id,
      required final MediaType type,
      required final MediaStatus status,
      required final List<String?> keywords,
      required final String title,
      final String? synopsis,
      required final String bannerImage,
      final String? trailer,
      final DateTime? startDate,
      final DateTime? endDate}) = _$_Media;

  factory _Media.fromJson(Map<String, dynamic> json) = _$_Media.fromJson;

  @override // 식별자
  String get id => throw _privateConstructorUsedError;
  @override // 미디어 타입
  MediaType get type => throw _privateConstructorUsedError;
  @override // 미디어 상태
  MediaStatus get status => throw _privateConstructorUsedError;
  @override // 태그 및 관련 정보
  List<String?> get keywords => throw _privateConstructorUsedError;
  @override // 미디어 제목
  String get title => throw _privateConstructorUsedError;
  @override // 미디어 개요
  String? get synopsis => throw _privateConstructorUsedError;
  @override // 배너 이미지
  String get bannerImage => throw _privateConstructorUsedError;
  @override // 미리보기 영상
  String? get trailer => throw _privateConstructorUsedError;
  @override // 시작 날짜
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override // 종료 날짜
  DateTime? get endDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
// 식별자
  String get id => throw _privateConstructorUsedError; // 저자 이름
  String get author => throw _privateConstructorUsedError; // 시청 후 느낀 감정
  int get emotion => throw _privateConstructorUsedError; // 글 내용
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call({String id, String author, int emotion, String content});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? emotion = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      emotion: emotion == freezed
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  $Res call({String id, String author, int emotion, String content});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, (v) => _then(v as _$_Comment));

  @override
  _$_Comment get _value => super._value as _$_Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? emotion = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      emotion: emotion == freezed
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  const _$_Comment(
      {required this.id,
      required this.author,
      required this.emotion,
      required this.content});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

// 식별자
  @override
  final String id;
// 저자 이름
  @override
  final String author;
// 시청 후 느낀 감정
  @override
  final int emotion;
// 글 내용
  @override
  final String content;

  @override
  String toString() {
    return 'Comment(id: $id, author: $author, emotion: $emotion, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.emotion, emotion) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(emotion),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String id,
      required final String author,
      required final int emotion,
      required final String content}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override // 식별자
  String get id => throw _privateConstructorUsedError;
  @override // 저자 이름
  String get author => throw _privateConstructorUsedError;
  @override // 시청 후 느낀 감정
  int get emotion => throw _privateConstructorUsedError;
  @override // 글 내용
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
