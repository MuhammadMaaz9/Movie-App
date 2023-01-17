import 'dart:convert';

import 'package:movieapp/models/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<City> getdataa() async {
    City data;
    final response = await http
        .get(Uri.parse('https://covid-193.p.rapidapi.com/countries'), headers: {
      'X-RapidAPI-Key': '5286093799mshfc965fb95fa2a7dp16e23ejsn2fa2945866a2',
      'X-RapidAPI-Host': 'covid-193.p.rapidapi.com'
    });
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      data = City.fromJson(res);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

//final apiprovider = Provider<ApiServices>((ref) => ApiServices());
