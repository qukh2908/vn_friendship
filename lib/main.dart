import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vn_friendship/unit.dart';
import 'package:vn_friendship/view/auth/auth_gate_page.dart';
import 'package:vn_friendship/view/auth/login_page.dart';
import 'package:vn_friendship/view/auth/verify_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Tắt xoay màn hình
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      title: 'VN Friendship',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: sColor, background: bgColor),
        useMaterial3: true,
      ),
      home: const AuthGatePage(),
      getPages: [
        GetPage(
          name: '/loginPage',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/vefifyPage',
          page: () => VerifyPage(),
        ),
      ],
    );
  }
}