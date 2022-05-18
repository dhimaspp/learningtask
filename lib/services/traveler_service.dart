// ignore_for_file: library_prefixes, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learningtask/models/get_traveler.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

import 'dio_config.dart' as dioConfig;

class TravelerServices {
  static const String pathGetPageTraveler = '/api/Traveler?page=1';
  static const String pathPostTraveler = '/api/Traveler';
  final Xml2Json xml2Json = Xml2Json();

  Future getPageTraveler() async {
    try {
      var dio = await dioConfig.dio();

      Response response = await dio!.get(pathGetPageTraveler);
      xml2Json.parse(response.data);
      var convertedXML = xml2Json.toParker();
      print(convertedXML);
      final data = jsonDecode(convertedXML);
      print(data);

      return TravelPageResponse.fromJson(data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.response) {
        print(error.response!.data);
        var errorBody = error.response!.data;
        return errorBody;
      } else if (error.type == DioErrorType.connectTimeout) {
        return 'Koneksi terhenti, Harap periksa internet koneksi anda';
      } else {
        print(error.response!.data);
        return 'unknown error';
      }
    }
  }

  Future postTraveler(String name, String email, String address) async {
    var builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('Travelerinformation', nest: () {
      builder.element('name', nest: name);
      builder.element('email', nest: email);
      builder.element('adderes', nest: address);
    });
    final documentFromBuilder = builder.buildDocument();
    try {
      var dio = await dioConfig.dio();
      print(documentFromBuilder);

      Response response = await dio!.post(pathPostTraveler,
          data: documentFromBuilder, options: Options(contentType: 'text/xml'));
      xml2Json.parse(response.data);
      var convertedXML = xml2Json.toParker();
      print(convertedXML);
      final data = jsonDecode(convertedXML);
      print(data);

      return TravelPostResponse.fromJson(data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.response) {
        print(error.response!.data);
        var errorBody = error.response!.data;
        return errorBody;
      } else if (error.type == DioErrorType.connectTimeout) {
        return 'Koneksi terhenti, Harap periksa internet koneksi anda';
      } else if (error.type == DioErrorType.other) {
        return 'Koneksi terhenti, Harap periksa internet koneksi anda';
      } else {
        return error.response!.data;
      }
    }
  }

  Future putTraveler(
      String id, String name, String email, String address) async {
    var builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    // builder.namespace("http://www.w3.org/2001/XMLSchema",'xsd');
    // builder.namespace("http://www.w3.org/2001/XMLSchema-instance",'xsi');
    builder.element('Travelerinformation', namespaces: <String, String>{
      "http://www.w3.org/2001/XMLSchema": "xsd",
      "http://www.w3.org/2001/XMLSchema-instance": "xsi"
    }, nest: () {
      builder.element('id', nest: id);
      builder.element('name', nest: name);
      builder.element('email', nest: email);
      builder.element('adderes', nest: address);
    });
    final documentFromBuilder = builder.buildDocument();
    try {
      var dio = await dioConfig.dio();
      print(documentFromBuilder);
      print(pathPostTraveler + '/' + id);

      Response response = await dio!.put(pathPostTraveler + '/' + id,
          data: documentFromBuilder, options: Options(contentType: 'text/xml'));
      xml2Json.parse(response.data);
      var convertedXML = xml2Json.toParker();
      print(convertedXML);
      final data = jsonDecode(convertedXML);
      print(data);

      return TravelPostResponse.fromJson(data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.response) {
        print(error.response!.data);
        var errorBody = error.response!.data;
        return errorBody;
      } else if (error.type == DioErrorType.connectTimeout) {
        return 'Koneksi terhenti, Harap periksa internet koneksi anda';
      } else if (error.type == DioErrorType.other) {
        return 'Koneksi terhenti, Harap periksa internet koneksi anda';
      } else {
        return error.response!.data;
      }
    }
  }
}
