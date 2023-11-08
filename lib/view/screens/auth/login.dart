import 'package:coachiko/view/screens/auth/login_screen.dart';
import 'package:coachiko/view/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/services/auth_services.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Widget build(BuildContext context) {

    AuthService authService = AuthService();
    return Scaffold(
      body: Scaffold(
        body:Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/bs.png",
                    ),
                    fit: BoxFit.fitWidth)),
          ),
          Container(
            margin: EdgeInsets.only(top: 520.h),
            padding: EdgeInsets.symmetric(horizontal: 14.w,),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: ()async => await authService.hangleSignIn(),
                  splashColor: Colors.black.withOpacity(1),
                  color: Colors.white,
                  height: 45,
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8),
                          right: Radius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            width: 20,
                            image: AssetImage("assets/g.png"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "1".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {
                      Get.to(signUp());
                  },
                  splashColor: Colors.black.withOpacity(1),
                  color: Colors.blueAccent,
                  height: 45,

                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8),
                          right: Radius.circular(8))),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "3".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                  SizedBox(
                  height: 5.h,
                ),

                InkWell(onTap: () {Get.to(logInScreenPage());},child: Text("Already have an account? Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),))
              ],
            ),
          ),
        ],
      ),)
    );
  }
}
