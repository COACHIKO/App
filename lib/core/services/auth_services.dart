import 'dart:convert';



import 'package:coachiko/view/screens/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../data/models/foodModel.dart';
import '../../main.dart';
bool? bo;
class AuthService{
  ///Google SIGN IN
  Future register(String user, String pass, String email) async {
    var url = Uri.http("192.168.1.2", '/coachikoapp/auth/logingoogle.php', );
    var response = await http.post(url, body: {
      "username": user,
      "email": email,
      "password": pass,
    });
    var data = json.decode(response.body);
    if (data["status"].toString() == "Success") {
      myServices.sharedPreferences.setInt("user", data["data"]["id"]);}else if(data["status"].toString() == "Account Created Successfully"){
      register(user, pass, email);
    }


}


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<dynamic> hangleSignIn() async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
      try{await register("${googleUser!.id.toString()}${googleUser.displayName!.replaceAll(" ", "").toString()}", "${googleUser.id.toString()}${googleUser.email.toString()}", googleUser.email.toString());
      FoodQuantConvert (String Foods){
        RegExp regex = RegExp(r'(\w+[\s\w]*):\s*([\d.]+)');
        Iterable<Match> matches = regex.allMatches(Foods);
        for (Match match in matches) {
          String key = match.group(1)!;
          double value = double.parse(match.group(2)!);
          jsonData[key] = value;
        }
        return jsonData;
      }
      parseFoodItems(String inputString) {
        RegExp regExp = RegExp(r'foodName:(.*?)\s+calories:(\d+\.\d+)\s+protein:(\d+\.\d+)\s+carbohydrate:(\d+\.\d+)\s+fat:(\d+\.\d+)\s+isFirstClick:(\w+)\s+isSelected:(\w+)');
        Iterable<Match> matches = regExp.allMatches(inputString);

        for (Match match in matches) {
          foodDataModel item = foodDataModel(
            foodName: match.group(1)!,
            calories: double.parse(match.group(2)!),
            protein: double.parse(match.group(3)!),
            carbohydrate: double.parse(match.group(4)!),
            fat: double.parse(match.group(5)!),
            isFirstClick: match.group(6)! == 'true',
            isSelected: match.group(7)! == 'true',
          );
          foodItems.add(item);
        }

      }
      Future GetUserData() async {
        var url = Uri.http("192.168.1.2", '/coachikoapp/viewuserdata.php', {'q': '{http}'});
        var response = await http.post(url, body: {
          "userid": myServices.sharedPreferences.getInt("user").toString(),
        });
        data = json.decode(response.body);
        if (data["status"] == "Success") {
          FoodQuantConvert(data["data"]["foodQuantity"]);
          parseFoodItems((data["data"]["filterdList"]));
          mybox!.put("Tdee", data["data"]["tdee"]);
          mybox!.put("targetProtien", data["data"]["targetProtien"]);
          mybox!.put("targetCarb", data["data"]["targetCarb"]);
          mybox!.put("targetFat", data["data"]["targetFat"]);
          mybox!.put("foodQuantity", jsonData);
          mybox!.put("filterdList", foodItems);
          mybox!.put("calofProtien", data["data"]["calofProtien"]  );
          mybox!.put("calofCarb", data["data"]["calofCarb"]);
          mybox!.put("calofFat", data["data"]["calofFat"]);
          mybox!.put("protienofProtien", data["data"]["protienofProtien"]);
          mybox!.put("protienofCarb",  data["data"]["protienofCarb"] );
          mybox!.put("protienofFat",  (data["data"]["protienofFat"])  );
          mybox!.put("carbofProtien",  data["data"]["carbofProtien"] );
          mybox!.put("carbofCarb",  data["data"]["carbofCarb"] );
          mybox!.put("carbofFat",  data["data"]["carbofFat"] );
          mybox!.put("fatofProtien",  data["data"]["fatofProtien"] );
          mybox!.put("fatofCarb",  data["data"]["fatofCarb"] );
          mybox!.put("fatofFat",  data["data"]["fatofFat"] );
          myServices.sharedPreferences.setBool("goHome", true);
        }

      }
      await GetUserData();

      if(data!["status"] == "Success"){
        bo=true;
        Get.offAll(HomePage());
      }
      }catch(e){print("======================$e=======================");}

    }catch(e){ print('Error signing in with Google: $e');}
  }
  /// Google Sign Out
  Future <void> hangleSignOut()  async{
    await _googleSignIn.signOut();
    await _auth.signOut() ;
     bo=false;
  }
  /// End Of Google Hangle









}

Future login(user,pass) async {
  var url = Uri.http("192.168.8.12", '/flutter_login/login.php', {'q': '{http}'});
  var response = await http.post(url, body: {
    "username": user.text,
    "password": pass.text,
  });
  var data = json.decode(response.body);
  if (data.toString() == "Success") {
    Fluttertoast.showToast(
      msg: 'Login Successful',
      backgroundColor: Colors.green,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );


  } else {
    Fluttertoast.showToast(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      msg: 'Username and password invalid',
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
