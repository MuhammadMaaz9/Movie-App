// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../models/model.dart';
// import 'package:http/http.dart' as http;

// import '../services/services.dart';

// // final getprovider = FutureProvider(
// //   (ref) async {
// //     return ref.read(apiprovider).getdata();
// //   },
// // );

// class ImageScreen extends ConsumerStatefulWidget {
//   const ImageScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ImageScreenState();
// }

// class _ImageScreenState extends ConsumerState<ImageScreen> {
//   @override
//   Widget build(BuildContext context) {
//    // final data = ref.watch(getprovider);
//     return Scaffold(
//      // body: data.when(
//         //data: (data) {
//           return ListView.builder(
//             itemCount: data.items.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: Image.network(data.items[index].image.toString()),
//               );
//             },
//           );
//         },
//         error: (error, stackTrace) => Text(error.toString()),
//         loading: () => Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
