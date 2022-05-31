import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../Model/home_model.dart';

class HomeProvider with ChangeNotifier {

  bool _dataStatus = true;

  bool get dataStatus => _dataStatus;

  Map _data = {};

  Map get data => _data;

  List _list = [];
  List get list => _list;

  Future homeProviderData(BuildContext context) async {
    try {
      _dataStatus = true ;
      notifyListeners();
      http.Response response;
      var url = Uri.parse(
          "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-01&endtime=2020-01-02"
      );
      response = await http.get(url,);
      if (response.statusCode == 200) {
        _data = jsonDecode(response.body);
        _dataStatus = false;
      } else {
        _dataStatus = false;
        _data = {
          'status': 0,
        };
      }
    } on SocketException {
      _dataStatus = false;
      _data = {
        'status': 2,
      };
      throw ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.redAccent.shade700,
          content: const Text(
            'No Internet Connection',
            style: TextStyle(
            color: Colors.white,
          ),),
        ),
      );
    } on Exception catch (e) {
      print(e);
      _dataStatus = false;
      _data = {
        'status': 0,
      };
    }
    notifyListeners();
  }

}