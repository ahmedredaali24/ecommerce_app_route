import 'package:e_commerce_route/domin/enitity/auth_result_Entity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDdjZjZmNTE1YmRjZjM0N2MwOWYxNyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEzODI0ODc3LCJleHAiOjE3MjE2MDA4Nzd9.1gETFX30uKiOaFYaaO6RJYYithv5zx06SQIGT24tvQA"

class LoginResponseDto {
  LoginResponseDto({
      this.message,
      this.user,
      this.token,});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg= json['statusMsg'];

    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg']=statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
         userEntity: user?.toUserEntity(),
      token: token
    );
  }
}