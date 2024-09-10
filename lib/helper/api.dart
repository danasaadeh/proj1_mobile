import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/helper/constante.dart';

//ngrok config add-authtoken 2kgeJ4efUETqnZC8QD56nCe9feA_78ebrstyEeiVFuraXdVDG
class Api {
  // https://012f-77-44-192-220.ngrok-free.app
  //String base_url = "http://127.0.0.1:8000/api";
  String base_url = "http://192.168.1.5:8000/api";
  //String base_url = "http://192.168.1.5:8000/api";
  //String base_url = "https://fb4e-178-52-248-31.ngrok-free.app/api";
  Future<http.Response> get(
      {required String url, @required String? token}) async {
    print('inside api class');

    Map<String, String> headers = {'Accept': 'application/json'};
    // if (token != null) {
    headers.addAll({"Authorization": "Bearer ${prefs!.getString("token")}"});
    // }
    print("this is the headers ${headers}");

    print("url=$url  token=$token");
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    print(response);
    inspect(response);
    return response;
  }

  Future<http.Response> post({
    required String url,
    @required dynamic body,
    @required String? token,
    @required String? content,
  }) async {
    // var token = prefs?.get('token');
    Map<String, String> headers = {'Accept': 'application/json'};
    if (token != null) {
      print('danaaaa');
      headers.addAll({"Authorization": "Bearer ${prefs!.getString("token")}"});
      print('hiiiiiiiiiiiiii');
    }
    if (content != null) {
      print('danaaaa');
      headers.addAll({"Content-Type": content});
      print('contetnttttt');
    }
    print('beforeeeeee');
    print("url=$url body=$body token=$token");
    print('afterrrrrrrr');

    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    print(response);
    inspect(response);
    print('finalllllllllll');
    return response;
  }

  // Future<http.StreamedResponse> postWithImage({
  //   required String url,
  //   required Map<String, dynamic> body,
  //   File? file,
  //   String? token,
  // }) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.get('token');
  //   final request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.headers.addAll({"Accept": "application/json"});
  //   if (token != null) {
  //     request.headers.addAll({"Authorization": "Bearer $token"});
  //   }
  //   body.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //   if (file != null) {
  //     final fileName = file.path.split('/').last;
  //     final fileType = fileName.split('.').last;
  //     print(fileType);
  //     if (fileType == 'png' || fileType == 'jpg' || fileType == 'jpeg') {
  //       // final multipartFile = http.MultipartFile.fromPath(
  //       //   'image', file.path
  //       //   // fileStream,
  //       //   // fileLength,
  //       //   // filename: fileName,
  //       // );
  //       request.files.add(await http.MultipartFile.fromPath('image', file.path
  //           // fileStream,
  //           // fileLength,
  //           // filename: fileName,
  //           ));
  //     } else {
  //       throw Exception(
  //           'Invalid file type. Please select a PNG, JPG, or JPEG image.');
  //     }
  //   }
  //   final response = await request.send();
  //   // final responseString = await response.stream.bytesToString();
  //   // final data = jsonDecode(responseString);
  //   return response;
  // }

  Future<http.Response> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString('token');
    Map<String, String> headers = {'Accept': 'application/json'};

    //if (token != null) {
    headers.addAll({"Authorization": "Bearer $token"});
    //}
    print("url=$url body=$body token=$token");
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    return response;
  }

  Future<dynamic> delete(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    print("start api");
    var token = prefs!.getString('token');
    Map<String, String> headers = {'Accept': 'application/json'};

    headers.addAll({"Authorization": "Bearer $token"});

    print("url=$url body=$body token=$token");
    http.Response response =
        await http.delete(Uri.parse(url), body: body, headers: headers);
    return response;
  }
}

class ValidationException implements Exception {
  Map<String, List<dynamic>> errors;
  ValidationException({required this.errors});
}

class FailureException implements Exception {
  String message;
  FailureException({required this.message});
}
