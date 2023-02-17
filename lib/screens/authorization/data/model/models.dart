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
