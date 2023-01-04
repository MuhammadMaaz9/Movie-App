import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/screens/image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<Movie> userdata = [];

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageScreen(),
                              ),
                            );
                          },
                          child: ListTile(
                            trailing: Text(snapshot
                                .data!.items[index].releaseState
                                .toString()),
                            subtitle: Text(
                              snapshot.data!.items[index].genres.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                                snapshot.data!.items[index].title.toString()),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
