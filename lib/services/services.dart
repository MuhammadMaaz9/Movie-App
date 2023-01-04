import 'dart:convert';

import 'package:movieapp/models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Future<List<Movie>> getData() async {
  //   var url = Uri.parse('https://imdb-api.com/en/API/ComingSoon/k_8v6h59og');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return Item.fromJson(json.decode(response.body));
  //   }
  // }
  // Future<List<Movie>> getdata() async {
  //   final response = await http
  //       .get(Uri.parse('https://imdb-api.com/en/API/ComingSoon/k_8v6h59og'));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map i in data) {

  //     }

  //   } else {

  //   }
  // }
}
