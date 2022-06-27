import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Entity
@freezed
class User with _$User {
  const factory User({
    // 식별자
    required String id,

    // 닉네임
    required String name,

    // 이메일
    String? email,

    // 성별
    String? gender,

    // 생일
    DateTime? birthdate,
  }) = _User;

  factory User.fromJson(json) => _$UserFromJson(json);
}
