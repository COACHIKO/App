import 'dart:convert';

import 'package:coachiko/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../main.dart';
import '../AuthFork.dart';

class logInScreenPage extends StatefulWidget {
   logInScreenPage({super.key});

  @override
  State<logInScreenPage> createState() => _logInScreenPageState();
}

class _logInScreenPageState extends State<logInScreenPage> {
  final loginkey = GlobalKey<FormState>();

   Future login(user, pass) async {
     var url = Uri.http("192.168.1.2",'/coachikoapp/auth/login.php', {'q': '{http}'});
     var response = await http.post(url, body: {
       "username": user,
       "password": pass,
     });
     var data = json.decode(response.body);
     if (data["status"].toString() == "Success") {
         myServices.sharedPreferences.setInt("user", data["data"]["id"]);
         Get.offAll(AuthPage());
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

   TextEditingController username = new TextEditingController();

  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,appBar: AppBar(backgroundColor:Color(0xFF1c1c1e),centerTitle: true,title: Text("Login"),
      leading: IconButton(onPressed: () {Get.back();}, icon: Icon(Icons.arrow_back_sharp),color: Colors.blueAccent,),),
      body:SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
        child: Container(padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: loginkey,
            child: Column(children: [
              Container(

                child: Image(height: 120.h,
                  image: AssetImage("assets/100.png",),
                  fit: BoxFit.fitHeight,
                ),
              ),


              TextFormField(
                controller: username,
                keyboardType: TextInputType.visiblePassword,
                onSaved: (value) {},
                validator: (value)
                {
                  if (value == null || value.isEmpty||value==0) {return "33".tr;}return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 14.sp), textAlign: TextAlign.start, decoration:
              InputDecoration(errorStyle: const TextStyle(color: Colors.blueAccent), focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(12)),),
                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                fillColor: const Color(0xff1f1f1F),
                filled: true,
                label: Text("Username or Email"),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white,fontSize: 14.sp),),),
              SizedBox(height: 8.h,),
              TextFormField(
                controller: password,
                obscureText: true, // Password is hidden
                keyboardType: TextInputType.visiblePassword,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(80), // Limit the password to 20 characters
                ],
                onSaved: (value) {
                  // Handle the saved password value here
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                    return "Password must contain at least one letter";
                  }
                  return null;
                },

                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.blueAccent),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    fillColor: Color(0xff1f1f1F),
                    filled: true,
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14)),),
              Container(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Center(
                    child: MaterialButton(
                      color: const Color(0xff1f1f1F),
                      minWidth: 155,
                      height: 45.h,
                      splashColor: Colors.blueAccent,
                      shape: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(15)),
                      onPressed: () async{
                        if (loginkey.currentState!.validate()) {
                          loginkey.currentState!.save();

                          await login(username.text.toString(), password.text.toString());


                        }                    },
                      child:  Text("Register",
                          style:
                          TextStyle(color: Colors.white)),
                    ),
                  )),









            ]),
          ),
        ),
      ),);
  }
}
