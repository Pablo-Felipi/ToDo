import 'dart:convert';

import 'package:todo_flutter/app/interfaces/interface_client_http.dart';
import 'package:http/http.dart' as http;

class HttpClient implements InterfaceClientHttp {
  final client = http.Client();
  @override
  Future getData({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  Future createData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await client.post(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  @override
  Future deleteData({required String url, required int id}) async {
    return await client.delete(Uri.parse('$url/$id'));
  }

  @override
  Future updateData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await client.put(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(data),
    );
  }
}
