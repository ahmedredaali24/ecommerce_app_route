import 'package:e_commerce_route/data/model/response/ErrorDto.dart';
import 'package:e_commerce_route/domin/enitity/auth_result_Entity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmut8tji@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MTU1OGY1YmU4YjUyMzIzNWMzM2Y5MiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEyNjc1MDYxLCJleHAiOjE3MjA0NTEwNjF9.mD1KEz2jkRFVJ1Uq4QgleJZlBkDqNJ2dromhL0zEzyk"

class RegisterResponseDto {
  RegisterResponseDto(
      {this.message, this.user, this.token, this.statusMsg, this.errorDto});

  RegisterResponseDto.fromJson(dynamic json) {

    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errorDto =
        json['errors'] != null ? ErrorDto.fromJson(json['errors']) : null;

    token = json['token'];
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  ErrorDto? errorDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (errorDto != null) {
      map['errors'] = errorDto?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity()

    );
  }
}
