import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/screens/image_screen.dart';
import 'package:movieapp/services/services.dart';

final getprovider = FutureProvider(
  (ref) async {
    return ref.read(apiprovider).getdata();
  },
);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(getprovider);
    return Scaffold(
      body: data.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.items.length,
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
                  title: Text(data.items[index].title.toString()),
                  subtitle: Text(data.items[index].stars.toString()),
                  trailing: Text(data.items[index].year.toString()),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}


// SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder(
//                 future: getdata,
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.items.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             
//                           },
//                           child: ListTile(
//                             trailing: Text(snapshot
//                                 .data!.items[index].releaseState
//                                 .toString()),
//                             subtitle: Text(
//                               snapshot.data!.items[index].stars.toString(),
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             title: Text(
//                                 snapshot.data!.items[index].title.toString()),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
