import 'package:flutter/material.dart';
import 'package:payment_app/view/pages/home_screen.dart';
import 'package:payment_app/view_model/user_mobx.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<UserMobx>(create: (_) => UserMobx()..fetchUser()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

