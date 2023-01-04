import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/model.dart';
import 'package:http/http.dart' as http;

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Image.network(
                            snapshot.data!.items[index].image.toString()),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
