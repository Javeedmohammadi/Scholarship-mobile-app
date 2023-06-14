
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'app_exceptions.dart';


enum NetworkState{
  loading,success,failed,
}

class BaseClient {

  Uri getUri(String api) {
    return Uri.parse('https://opportunity.quizinno.com/api/$api');
  }

  // token
  static const String bearerToken = "123456784567";

  Future<Map<String,String>> getHeaders() async {
    Map<String,String> headers ={
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    };
    return headers;
  }

  static const int timeOutDuration = 20;

  Future<dynamic> get(String api) async {
    try{
      var response = await http.get(getUri(api),
      headers: await getHeaders(),
      ).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    }
    on SocketException{
      throw FetchDataException(message: "No Internet Connection", url: getUri(api).toString());
    }
    on TimeoutException {
      throw ApiNotResponding(message: "Slow Connection", url: getUri(api).toString());
    }
  }

  Future<dynamic> post(String api, dynamic data) async {
    try{
      var response = await http.post(
          getUri(api),
          headers: await getHeaders(),
          body: jsonEncode(data)).timeout(const Duration(seconds: timeOutDuration));
      debugPrint(response.body);
      return _processResponse(response);
    }
    on SocketException{
      throw FetchDataException(message: "No Internet Connection", url: getUri(api).toString());
    }
    on TimeoutException {
      throw ApiNotResponding(message: "Slow Connection", url: getUri(api).toString());
    }

  }

  Future<dynamic> postForm(http.MultipartRequest request) async {

    try{
      request.headers.addAll(await getHeaders());
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse).timeout(const Duration(seconds: 30));
      debugPrint(response.body);
      return _processResponse(response);
    }
    on SocketException{
      throw FetchDataException(message: "No Internet Connection", url: request.url.toString());
    }
    on TimeoutException {
      throw ApiNotResponding(message: "Slow Connection", url: request.url.toString());
    }

  }


  void handleError(error) {

    if(error is BadRequestException) {
      throw error.message!;
    }
    if(error is ApiNotResponding) {
      throw error.message!;
    }
    else if (error is FetchDataException){
      throw error.message!;
    }
    else if (error is UnAuthorizedException){
      throw error.message!;
    }
    else if(error is ValidationError){
      throw error.message!;
    }
    else {
      throw "Something Went Wrong";
    }
  }

  dynamic _processResponse(http.Response response) {

    switch (response.statusCode) {
      case 200:
        // var responseJson = response.body;
        return response.body;

      case 400: throw BadRequestException(message: jsonDecode(response.body)['message'], url: response.request?.url.toString());
      case 401:
      case 403:throw UnAuthorizedException(message: jsonDecode(response.body)['message'], url: response.request?.url.toString());
      case 420:throw AlreadySavedException(message: jsonDecode(response.body)['message'], url: response.request?.url.toString());
      case 422:throw ValidationError(message: jsonDecode(response.body)['errors'].toString(), url: response.request?.url.toString());
      case 500:
        default:throw FetchDataException(message: jsonDecode(response.body)['message'], url: response.request?.url.toString());

    }
  }


}