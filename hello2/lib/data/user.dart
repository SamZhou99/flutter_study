import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  String name;
  String email;

  User(this.name, this.email);

  @override
  String toString() {
    return 'User{name: $name, email: $email}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
