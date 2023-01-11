import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<Movie> getdata() async {
    final response = await http
        .get(Uri.parse('https://imdb-api.com/en/API/ComingSoon/k_8v6h59og'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Movie.fromJson(data);
    } else {
      return Movie.fromJson(data);
    }
  }
}

final apiprovider = Provider<ApiServices>((ref) => ApiServices());
