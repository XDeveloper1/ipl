import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipl/MainScreen.dart';
import 'package:ipl/admin.dart';
import 'package:ipl/faltu.dart';

Future<void> initializeFlutterFire() async {
  try {
    await Firebase.initializeApp();
    print("sucess");
  } catch (e) {
    print(e);
    print("sucess");

  }
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("sucess");
  } catch (e) {
    print(e);
    print("sucessasdsadsad");

  }

  runApp( MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Material APP',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MainScreen(),
        ),
      );
  }
}

