// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

City? cityFromJson(str) => City.fromJson(json.decode(str));

String cityToJson(City? data) => json.encode(data!.toJson());

class City {
  City({
    this.cityGet,
    this.parameters,
    this.errors,
    this.results,
    required this.response,
  });

  String? cityGet;
  List<dynamic>? parameters;
  List<dynamic>? errors;
  int? results;
  List<String?> response;

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityGet: json["get"],
        parameters: json["parameters"] == null
            ? []
            : List<dynamic>.from(json["parameters"]!.map((x) => x)),
        errors: json["errors"] == null
            ? []
            : List<dynamic>.from(json["errors"]!.map((x) => x)),
        results: json["results"],
        response: json["response"] == null
            ? []
            : List<String?>.from(json["response"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "get": cityGet,
        "parameters": parameters == null
            ? []
            : List<dynamic>.from(parameters!.map((x) => x)),
        "errors":
            errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
        "results": results,
        "response":
            response == null ? [] : List<dynamic>.from(response.map((x) => x)),
      };
}
