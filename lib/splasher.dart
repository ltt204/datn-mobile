import 'package:flutter/material.dart';
import 'package:datn_mobile/app/view/app.dart';
import 'package:datn_mobile/bootstrap.dart';
import 'package:datn_mobile/features/splash/view/splash_view.dart';

class Splasher extends StatelessWidget {
  const Splasher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashView(
        removeSplashLoader: false,
        onInitialized: (container) {
          bootstrap(() => const App(), parent: container);
        },
      ),
    );
  }
}
