import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/providers/api_provider.dart';
import 'package:movieapp/view/image_screen.dart';
import 'package:movieapp/services/services.dart';
import 'package:provider/provider.dart';

// final getprovider = FutureProvider(
//   (ref) async {
//     return ref.read(apiprovider).getdata();
//   },
// );

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false).getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    //final data = ref.watch(getprovider);
    final provider = Provider.of<ApiProvider>(context);
    return Scaffold(body: Consumer<ApiProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: value.city.response.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.city.response[index].toString()),
            );
          },
        );
      },
    ));
  }
}


// Column(
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
      


// data.when(
//         data: (data) {
//           return ListView.builder(
//             itemCount: data.items.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ImageScreen(),
//                     ),
//                   );
//                 },
//                 child: ListTile(
//                   title: Text(data.items[index].title.toString()),
//                   subtitle: Text(data.items[index].stars.toString()),
//                   trailing: Text(data.items[index].year.toString()),
//                 ),
//               );
//             },
//           );
//         },
//         error: (error, stackTrace) => Text(error.toString()),
//         loading: () => Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),