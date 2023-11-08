import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/auth_services.dart';
import '../../data/models/foodModel.dart';
import '../../main.dart';
import 'HomePage.dart';
import 'OnBoarding.dart';
import 'auth/login.dart';
import 'package:http/http.dart' as http;


class AuthPage extends StatefulWidget  {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AutthPageState();
}
class _AutthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot)   {

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),);
          }else if (snapshot.hasData || myServices.sharedPreferences.getInt("user") != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.offAll(OnboardingScreen());});
            return Container();
          }else {
          return LoginScreen();
          }
        },
      ),
    );
  }
}
