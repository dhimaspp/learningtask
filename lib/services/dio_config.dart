import 'dart:async';
import 'package:dio/dio.dart';

Dio? dioInstance;
createInstance() async {
  var option = BaseOptions(
      baseUrl: "http://restapi.adequateshop.com",
      connectTimeout: 10000,
      receiveTimeout: 10000);

  dioInstance = Dio(option);
  // dioInstance!.interceptors.add(PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     error: true,
  //     compact: true,
  //     maxWidth: 90));
}

Future<Dio?> dio() async {
  await createInstance();
  dioInstance!.options.baseUrl = "http://restapi.adequateshop.com";
  return dioInstance;
}
