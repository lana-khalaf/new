// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Api
// {
// Future<dynamic> get({required String url}) async{
// http.Response response= await http.get(Uri.parse(url));
// if(response.statusCode==200){
//   return jsonDecode(response.body);
// }
//  else{
//     throw Exception('there is a problem with status code ${response.statusCode}');

//   }
// }
// Future<dynamic> post ({required String url, @required dynamic body, @required String? token})async{
//   Map<String,String> headers={};
//   if(token!=null){
//     headers.addAll({
// "Authorizatoin":"Bearer $token"
//     });
//   }
//   http.Response response = await http.post(Uri.parse(url),body: body,headers: headers);
// Map<String,dynamic> data =jsonDecode(response.body);
// return data;
// }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project/cubit/token.dart';
class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.0.2:8000/api/',
      followRedirects: true,  // Set to true to follow redirects
      maxRedirects: 5,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type':'application/json',
      },
     
      connectTimeout: Duration(seconds: 15),
  receiveTimeout: Duration(seconds: 15),

    ),
  );
  static init (){
    dio = Dio(
      BaseOptions(
        // baseUrl : 'http://localhost:8000/api/',
        receiveDataWhenStatusError: true,
         followRedirects: true,  // Set to true to follow redirects
        maxRedirects: 5,     
      ),
    );
  }
  static Future<Response> getDate({
    required String url,
     Map<String,dynamic>? query,
     String lang ='ar',
    String? token ,
  })async{
    dio.options.headers ={
      'content-type':'application/json',
      'Accept':"application/json",
    'authorization':"Bearer ${await AuthManager.getToken()}",
  };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
     required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang ='ar',
    String? token,
  })async{
dio.options.headers = {
  
    'lang':lang,
    'Authorization':"Bearer ${token}",
  };


    return dio.post(
      url,
      queryParameters: query,
      data: data,
      );
  }

  static Future<Response> putData({
     required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang ='ar',
    String? token,
  })async{
dio.options.headers = {
  
    'lang':lang,
    'Authorization':token,
  };


    return dio.put(
      url,
      queryParameters: query,
      data: data,
      );
  }

}