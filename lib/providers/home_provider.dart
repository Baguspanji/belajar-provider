import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:make_provider/models/barang_model.dart';
import 'package:make_provider/services/api.dart';

class HomeProvider extends ChangeNotifier {
  List<BarangModel> _barang = [];
  List<BarangModel> get barang => _barang;

  Future<void> getBarang() async {
    final res = await Api().getBarang();

    try {
      if (res.statusCode == 200) {
        _barang = (jsonDecode(res.body)['data'] as List).isNotEmpty
            ? (jsonDecode(res.body)['data'] as List)
                .map((e) => BarangModel.fromJson(e))
                .toList()
            : [];
      } else {
        _barang = [];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
