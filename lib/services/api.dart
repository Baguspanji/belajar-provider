import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

class Api {
  final String base_url = 'https://tumbasonline.com/sarpras/api/';

  Future<http.Response> getBarang() async {
    Uri uri = Uri.parse('$base_url/barang');

    var res = await http.get(uri);

    return getRes(res);
  }
}

// ==========================================

Future<http.Response> getRes(http.Response res) async {
  try {
    return res;
  } on SocketException catch (e) {
    throw Exception(e.toString());
  } on HttpException {
    {
      throw Exception("tidak menemukan post");
    }
  } on FormatException {
    throw Exception("request salah");
  } on TimeoutException catch (e) {
    throw Exception(e.toString());
  }
}
