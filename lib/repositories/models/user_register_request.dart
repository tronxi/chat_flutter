import 'package:json_annotation/json_annotation.dart';

part 'user_register_request.g.dart';

@JsonSerializable()
class UserRegisterRequest {
  final String name;
  final String password;

  const UserRegisterRequest({required this.name, required this.password});

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) => _$UserRegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterRequestToJson(this);

}
