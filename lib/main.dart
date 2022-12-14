import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizly_app/auth/auth.dart';
import 'package:quizly_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizly_app/pages/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (FirebaseAuth.instance.currentUser != null) {
    var data = await getUser();
    runApp(GetMaterialApp(home: MenuPage(nick: data['nickname'],)));
  } else {
    runApp(const GetMaterialApp(home: LoginPage()));
  }
}
