// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.items,
    required this.errorMessage,
  });

  List<Item> items;
  String errorMessage;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}

class Item {
  Item({
    this.id,
    this.title,
    this.fullTitle,
    this.year,
    this.releaseState,
    this.image,
    this.runtimeMins,
    this.runtimeStr,
    this.plot,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingCount,
    this.metacriticRating,
    this.genres,
    this.genreList,
    this.directors,
    this.directorList,
    this.stars,
    this.starList,
  });

  String? id;
  String? title;
  String? fullTitle;
  String? year;
  String? releaseState;
  String? image;
  dynamic runtimeMins;
  dynamic runtimeStr;
  dynamic plot;
  dynamic contentRating;
  dynamic imDbRating;
  dynamic imDbRatingCount;
  dynamic metacriticRating;
  String? genres;
  List<GenreList>? genreList;
  dynamic directors;
  List<dynamic>? directorList;
  String? stars;
  List<StarList>? starList;

  factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        year: json["year"],
        releaseState: json["releaseState"],
        image: json["image"],
        runtimeMins: json["runtimeMins"],
        runtimeStr: json["runtimeStr"],
        plot: json["plot"],
        contentRating: json["contentRating"],
        imDbRating: json["imDbRating"],
        imDbRatingCount: json["imDbRatingCount"],
        metacriticRating: json["metacriticRating"],
        genres: json["genres"],
        genreList: List<GenreList>.from(
            json["genreList"].map((x) => GenreList.fromJson(x))),
        directors: json["directors"],
        directorList: List<dynamic>.from(json["directorList"].map((x) => x)),
        stars: json["stars"],
        starList: List<StarList>.from(
            json["starList"].map((x) => StarList.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "title": title,
        "fullTitle": fullTitle,
        "year": year,
        "releaseState": releaseState,
        "image": image,
        "runtimeMins": runtimeMins,
        "runtimeStr": runtimeStr,
        "plot": plot,
        "contentRating": contentRating,
        "imDbRating": imDbRating,
        "imDbRatingCount": imDbRatingCount,
        "metacriticRating": metacriticRating,
        "genres": genres,
        "genreList": List<dynamic>.from(genreList!.map((x) => x.toJson())),
        "directors": directors,
        "directorList": List<dynamic>.from(directorList!.map((x) => x)),
        "stars": stars,
        "starList": List<dynamic>.from(starList!.map((x) => x.toJson())),
      };
}

class GenreList {
  GenreList({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class StarList {
  StarList({
    this.id,
    this.name,
  });

  dynamic id;
  String? name;

  factory StarList.fromJson(Map<String, dynamic> json) => StarList(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
