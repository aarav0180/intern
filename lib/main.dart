// main.dart
import 'package:flutter/material.dart';
import 'package:intern/Pages/post.dart';
import 'package:provider/provider.dart';
import 'Provider/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()..fetchUserData()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: Post(),
      ),
    );
  }
}

