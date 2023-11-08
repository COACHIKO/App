import 'dart:convert';

import 'package:coachiko/view/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';

class signUp extends StatelessWidget {
   signUp({super.key});
  final signupkey = GlobalKey<FormState>();
   TextEditingController email    = new TextEditingController();
   TextEditingController username = new TextEditingController();
   TextEditingController password = new TextEditingController();

   Future register(String user, String pass, String email) async {
     var url = Uri.http("192.168.1.2", '/coachikoapp/auth/register.php', );
     var response = await http.post(url, body: {

       "username": user,
       "email": email,
       "password": pass,
     });
     var data = json.decode(response.body);

     if (data == "Error") {
       Fluttertoast.showToast(
         backgroundColor: Colors.orange,
         textColor: Colors.white,
         msg: 'User already exists!',
         toastLength: Toast.LENGTH_SHORT,
       );
     } else {
       Get.offAll(LoginScreen());
       Fluttertoast.showToast(
         backgroundColor: Colors.green,
         textColor: Colors.white,
         msg: 'Registration Successful',
         toastLength: Toast.LENGTH_SHORT,
       );
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,appBar: AppBar(backgroundColor:Color(0xFF1c1c1e),centerTitle: true,title: Text("Sign up"),
      leading: IconButton(onPressed: () {Get.back();}, icon: Icon(Icons.arrow_back_sharp),color: Colors.blueAccent,),),
      body:SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
        child: Container(padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: signupkey,
            child: Column(children: [
              Container(

                child: Image(height: 120.h,
                  image: AssetImage("assets/100.png",),
                  fit: BoxFit.fitHeight,
                ),
              ),



              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {},
                validator: (value)
                {
                  if (value == null || value.isEmpty||value==0) {return "33".tr;}
                  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else if (!emailRegex.hasMatch(value)) {
                    return "Invalid email address";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 14.sp), textAlign: TextAlign.start, decoration:
                InputDecoration(errorStyle: const TextStyle(color: Colors.blueAccent), focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                  errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(12)),),
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  fillColor: const Color(0xff1f1f1F),
                  filled: true,
                  label: Text("Email"),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white,fontSize: 14.sp),),
              ),
              SizedBox(height: 8.h,),
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
                label: Text("Username"),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white,fontSize: 14.sp),),),
              SizedBox(height: 8.h,),
              TextFormField(
                controller: password,
                obscureText: true, // Password is hidden
                keyboardType: TextInputType.visiblePassword,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(20), // Limit the password to 20 characters
                ],
                onSaved: (value) {
                  // Handle the saved password value here
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
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
                        if (signupkey.currentState!.validate()) {
                          signupkey.currentState!.save();

                         await register(username.text.toString(), password.text.toString(), email.text.toString());


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
