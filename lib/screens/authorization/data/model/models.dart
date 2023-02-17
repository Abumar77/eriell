import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? success;
  String? error;
  String? result;

  LoginResponse({this.success, this.error, this.result});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@HiveType(typeId: 0)
class UserHive extends HiveObject {
  UserHive({required this.password, required this.login});

  @HiveField(1)
  String login;
  @HiveField(2)
  String password;
  List<Object?> get props => [login, password];
}
