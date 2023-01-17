import 'package:flutter/material.dart';
import 'package:movieapp/providers/api_provider.dart';
import 'package:movieapp/view/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
