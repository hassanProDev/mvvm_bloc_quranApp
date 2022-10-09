import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_islami_app/data/remote/end_point.dart';
import 'package:mvvm_islami_app/model/radio/radio_model.dart';

Future<RadioModel> fetchData() async {
  var url = Uri.https(baseUrl, radioEndPoint, {});
  var response = await http.get(url);
  var responseBody = response.body;
  var json = jsonDecode(responseBody);
  return RadioModel.fromJson(json);
}
