import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/user/model/user_model.dart';

class UserRepository {
  final String baseUrl = "http://jsonplaceholder.type";

  final dio = Dio();

  Future<List<UserModel>>fetchUser() async{
    final response = await dio.get('$baseUrl/posts');

    if (response.statusCode == 200){
      List<dynamic> data = response.data;
      return data.map((json)=> UserModel.fromJson(json)).toList();
    } else{
      throw Exception('Failed to load posts');
    }
  }
}