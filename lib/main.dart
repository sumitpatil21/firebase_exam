import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_exam/HomePage/HomeScreen.dart';
import 'package:firebase_exam/LoginAndRegister/LoginPage.dart';
import 'package:firebase_exam/LoginAndRegister/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(TrackerApp());
}

class TrackerApp extends StatelessWidget {
  const TrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => (User==null)?LoginPage():HomeScreen() ,),
        GetPage(name: "/signup", page: () => RegisterPage(),)
      ],

    );
  }
}
