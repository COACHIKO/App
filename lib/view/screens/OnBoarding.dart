import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coachiko/core/localization/changelocal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/onboardingController.dart';
import '../../customAppBar.dart';
import '../../main.dart';
import 'HomePage.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});
  @override


  State<OnboardingScreen> createState() => _OnboardingScreenState();}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  TextEditingController waist = new TextEditingController();
  TextEditingController neck  = new TextEditingController();
  TextEditingController arm   = new TextEditingController();
  TextEditingController calve = new TextEditingController();
  TextEditingController hip   = new TextEditingController();
  TextEditingController chest = new TextEditingController();
  TextEditingController searchcontroller = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  final formkey4 = GlobalKey<FormState>();
  final formkey5 = GlobalKey<FormState>();
  LocaleController a = LocaleController();
  String  st = "";

  DateTime? dateofbirth;



  Future insertUserData(String genderSelect , String goalSelect , String activitySelect ,birthdayDate,weight,tall,costSelect,waist,neck,hip,tdee,preferedFoods,targetProtien, targetCarb, targetFat, foodQuantity, filterdList, calofProtien, calofCarb, calofFat, protienofProtien, protienofCarb, protienofFat, carbofProtien, carbofCarb, carbofFat, fatofProtien, fatofCarb, fatofFat ) async {
    var url = Uri.http("192.168.1.2", '/coachikoapp/insertuserdata.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "genderSelect":genderSelect,
      "goalSelect":goalSelect,
      "activitySelect":activitySelect,
      "birthdayDate":birthdayDate,
      "weight":weight,
      "tall":tall,
      "costSelect":costSelect,
      "waist":waist,
      "neck":neck,
      "hip":hip,
      "tdee":tdee,
      "preferedFoods":preferedFoods,
      "targetProtien": targetProtien,
      "targetCarb": targetCarb,
      "targetFat": targetFat,
      "foodQuantity": foodQuantity,
      "filterdList": filterdList,
      "calofProtien": calofProtien,
      "calofCarb": calofCarb,
      "calofFat": calofFat,
      "protienofProtien": protienofProtien,
      "protienofCarb": protienofCarb,
      "protienofFat": protienofFat,
      "carbofProtien": carbofProtien,
      "carbofCarb": carbofCarb,
      "carbofFat": carbofFat,
      "fatofProtien": fatofProtien,
      "fatofCarb": fatofCarb,
      "fatofFat": fatofFat,
      "userid": myServices.sharedPreferences.getInt("user").toString(),
    });
    var data = json.decode(response.body);

    if (data == "Error") {
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: 'Some Values Missing !',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: 'Data Stored Successfully',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }



  void dispose() {
    searchcontroller.dispose();
    controller.dispose();
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingController>(
      init: onBoardingController(),
      builder: (controllerget) => Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      /// GENDER SELECT ///
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            child: Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 50.h, left: 5),
                                    child: Text(
                                        "4".tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                  padding: EdgeInsets.only(top: 120.h),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controllerget.womanselected();
                                                 controllerget.update();
                                                controller.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.easeInOut);
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.asset(
                                                  "assets/2.png",
                                                  width: 150,
                                                  height: 150,
                                                  color: controllerget
                                                          .isSelectedWoMan
                                                      ? null
                                                      : Colors.grey,
                                                  colorBlendMode: controllerget
                                                          .isSelectedWoMan
                                                      ? null
                                                      : BlendMode.saturation,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controllerget.manselected();

                                                controller.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.easeInOut);
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.asset(
                                                  "assets/1.png",
                                                  width: 150,
                                                  height: 150,
                                                  color:
                                                      controllerget.isSelectedMan
                                                          ? null
                                                          : Colors.grey,
                                                  colorBlendMode:
                                                      controllerget.isSelectedMan
                                                          ? null
                                                          : BlendMode.saturation,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40.w, vertical: 8.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "5".tr,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10.w),
                                                child: Text(
                                                  "6".tr,
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      /// GOAL SELECT ///
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: Container(
                          color: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 22.w,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 50.h,horizontal: 22.w),
                                  child:  Text("7".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                padding: EdgeInsets.only(top: 120.h),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controllerget.LoseWheightselected();

                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 90.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isSelectedLoseWheight
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 40.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.h,
                                                      image: const AssetImage(
                                                        'assets/3.png',
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 0.w),
                                                  child: Text(
                                                    "8".tr,
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),

                                    SizedBox(height: 22.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget.GainWheightselected();

                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 90.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isSelectedGainWheight
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 40.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/4.png',
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: Text(
                                                    "9".tr,
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 22.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget.MintainWheightselected();

                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 90.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isSelectedMentainWheight
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 40),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/5.png',
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: Text(
                                                    "10".tr,
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /// ACTIVITY SELECT ///
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: Container(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 18.h),
                                  child:  Text("11".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                padding: EdgeInsets.only(top: 70.h),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controllerget
                                            .isLowActivitySelectedFunction();
                                        controllerget.Clasifications();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 75.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isLowActivitySelected
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w),
                                                      child: const Image(
                                                          height: 40,
                                                          width: 40,
                                                          image: AssetImage(
                                                            'assets/6.png',
                                                          )))),
                                              Text(
                                                "12".tr,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 18.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget
                                            .isLightActivitySelectedFunction();
                                        controllerget.Clasifications();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 75.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isLightActivitySelected
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/8.png',
                                                      ))),
                                              Text(
                                                "13".tr,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 18.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget
                                            .isModerateActivitySelectedFunction();
                                        controllerget.Clasifications();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 75.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isModerateActivitySelected
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/7.png',
                                                      ))),
                                              Text(
                                                "14".tr,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 18.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget
                                            .isHeavyActivitySelectedFunction();
                                        controllerget.Clasifications();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 75.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isHeavyActivitySelected
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 20.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/9.png',
                                                      ))),
                                              Text(
                                                "15".tr,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 18.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget
                                            .isExtreemActivitySelectedFunction();
                                        controllerget.Clasifications();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 75.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget
                                                    .isExtreemActivitySelected
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/10.png',
                                                      ))),
                                              Text(
                                                "16".tr,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /// BIRTHDAY DATE SELECT ///
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: Container(
                          color: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Stack(
                            children: [
                              Container(
                                  padding:
                                      EdgeInsets.only(top: 22.h, left: 10.w),
                                  child:  Text("17".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                  margin: EdgeInsets.only(top: 40.h),
                                  height: 400.h,
                                  child: CupertinoTheme(
                                      data: MaterialBasedCupertinoThemeData(

                                          materialTheme: ThemeData.dark()),
                                      child: CupertinoDatePicker(
                                        minimumYear: 1960,
                                        maximumYear: 2013,
                                        initialDateTime: DateTime.utc(2000),
                                        onDateTimeChanged: (value) {
                                          controllerget.birthDate = value;
                                          dateofbirth=value;
                                          controllerget.calculateAge();
                                        },

                                        mode: CupertinoDatePickerMode.date,
                                      ))),
                              Container(
                                  padding: EdgeInsets.only(top: 320.h),
                                  child: Center(
                                    child: MaterialButton(
                                      color: const Color(0xff1f1f1F),
                                      minWidth: 200.w,
                                      height: 45.h,
                                      splashColor: Colors.blueAccent,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      onPressed: () {
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Text("0".tr,
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      /// WEIGHT AND TALL SELECT ///
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: Center(
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                    top: 22.h,
                                    left: 22.w,
                                  ),
                                  child:  Text("18".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Stack(
                                children: [
                                  SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: 80,
                                      thumbShape:
                                          SliderComponentShape.noOverlay,
                                      overlayShape:
                                          SliderComponentShape.noOverlay,
                                      valueIndicatorShape:
                                          SliderComponentShape.noOverlay,
                                      trackShape:
                                          const RectangularSliderTrackShape(),

                                      /// ticks in between
                                      activeTickMarkColor: Colors.transparent,
                                      inactiveTickMarkColor: Colors.transparent,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 130.h, right: 200.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            "19".tr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          RotatedBox(
                                            quarterTurns: langcontroller.language== Locale("ar")?1:3,
                                            child: Slider(
                                              onChanged: (value) {
                                                if (value == 0) {
                                                  controllerget.pathway = false;
                                                  controllerget.Weight = value;
                                                  controllerget.update();
                                                } else {
                                                  controllerget.pathway = true;
                                                  controllerget.Weight = value;
                                                  controllerget.update();
                                                }
                                              },

                                              //  divisions: 200,
                                              inactiveColor:
                                                  const Color(0xff1f1f1F),
                                              activeColor: Colors.blueAccent,
                                              value: controllerget.Weight,
                                              min: 0, max: 200,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            controllerget.Weight
                                                .toStringAsFixed(1),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: 80,
                                      thumbShape:
                                          SliderComponentShape.noOverlay,
                                      overlayShape:
                                          SliderComponentShape.noOverlay,
                                      valueIndicatorShape:
                                          SliderComponentShape.noOverlay,

                                      trackShape:
                                          const RectangularSliderTrackShape(),

                                      /// ticks in between
                                      activeTickMarkColor: Colors.transparent,
                                      inactiveTickMarkColor: Colors.transparent,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 130.h, left: 200.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            "20".tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          RotatedBox(
                                            quarterTurns: langcontroller.language== Locale("ar")?1:3,
                                            child: Slider(
                                              onChanged: (value) {
                                                if (value == 0) {
                                                  controllerget.pathway = false;
                                                  controllerget.Tall = value;

                                                  controllerget.update();
                                                } else {
                                                  controllerget.pathway = true;

                                                  controllerget.Tall = value;
                                                  controllerget.update();
                                                }
                                              },
                                              inactiveColor:
                                                  const Color(0xff1f1f1F),
                                              activeColor: Colors.blueAccent,
                                              value: controllerget.Tall,
                                              min: 0,
                                              max: 250,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            controllerget.Tall.toStringAsFixed(
                                                1),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  controllerget.pathway == true
                                      ? const Text("")
                                      : Container(
                                          padding: EdgeInsets.only(top: 180.h),
                                          child: Center(
                                            child: Text(
                                              "21".tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp),
                                            ),
                                          )),
                                ],
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 400),
                                  child: Center(
                                    child: MaterialButton(
                                      color: const Color(0xff1f1f1F),
                                      minWidth: 200,
                                      height: 45,
                                      splashColor: Colors.blueAccent,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      onPressed: () {
                                        if (controllerget.Weight > 0 &&
                                            controllerget.Tall > 0) {
                                          controllerget.pathway = true;
                                          controllerget.update();
                                          controller.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.easeInOut);
                                        } else {
                                          controllerget.pathway = false;
                                          controllerget.update();
                                        }
                                      },
                                      child: Text("0".tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp)),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      /// Money Fellow
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: Container(
                          color: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 25.h),
                                  child: Text(
                                      "25".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                padding: EdgeInsets.only(top: 100.h),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controllerget.LowCostDietIsSelected();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 90.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget.Poormoney
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/11.png',
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: Text(
                                                    "22".tr,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 22.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget
                                            .MediumCostDietIsSelected();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 90.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget.Mediummoney
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: Image(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      image: const AssetImage(
                                                        'assets/12.png',
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: Text(
                                                    "23".tr,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                    SizedBox(height: 22.h),
                                    InkWell(
                                      onTap: () {
                                        controllerget.HighCostDietIsSelected();
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                          child: Container(
                                        height: 90.h,
                                        width: 340.w,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: controllerget.Richmoney
                                                ? Colors.blueAccent
                                                : const Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: const Image(
                                                      height: 40,
                                                      width: 40,
                                                      image: AssetImage(
                                                        'assets/13.png',
                                                      ))),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 30.w),
                                                  child: Text(
                                                    "24".tr,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /// MESUREMENTS OF BODY
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: Container(
                          padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 22.h),

                          child:SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("26".tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                SizedBox(height: 44.h,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(margin: EdgeInsets.only(top: 0.h),
                                          child: Image.asset(
                                            controllerget.isSelectedWoMan
                                                ? "assets/34.png"
                                                : "assets/35.png",
                                            height: 250.h,
                                           // width: 200.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                    controllerget.isSelectedMan ?Column(
                                      children: [

                                        /// WAIST
                                        Form(key: formkey,
                                          child: Center(
                                            child: SizedBox(
                                              height: 70.h,
                                              width: 100.w,
                                              child: TextFormField(
                                                controller: waist,
                                                maxLength: 3,
                                                keyboardType:
                                                TextInputType.number,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                onSaved: (value) {
                                                  controllerget.waist =
                                                      int.parse(value!);
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty||value==0) {
                                                    return "33".tr;
                                                  }
                                                  return null;
                                                },
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                                textAlign:
                                                TextAlign.center,
                                                decoration:
                                                InputDecoration(
                                                  errorStyle:
                                                  const TextStyle(
                                                      color: Colors
                                                          .blueAccent),
                                                  focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blueAccent)),
                                                  errorBorder:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            12)),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          12))),
                                                  fillColor: const Color(
                                                      0xff1f1f1F),
                                                  filled: true,
                                                  hintText: "27".tr,
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///NECK
                                        Form(key: formkey2,child: Center(
                                          child: SizedBox(
                                            height: 70.h,
                                            width: 100.w,
                                            child: TextFormField(
                                              controller: neck,
                                              maxLength: 3,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              onSaved: (value) {
                                                controllerget.neck =
                                                    int.parse(value!);
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty || value==0) {
                                                  return "33".tr;
                                                }
                                                return null;
                                              },
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp),
                                              textAlign:
                                              TextAlign.center,
                                              decoration:
                                              InputDecoration(
                                                errorStyle:
                                                const TextStyle(
                                                    color: Colors
                                                        .blueAccent),
                                                focusedErrorBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent)),
                                                errorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .blueAccent),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius
                                                          .circular(
                                                          12)),
                                                ),
                                                border: const OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        12))),
                                                fillColor: const Color(
                                                    0xff1f1f1F),
                                                filled: true,
                                                hintText: "28".tr,
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ),
                                        ///ARMS
                                        Center(
                                          child: SizedBox(
                                            height: 70.h,
                                            width: 100.w,
                                            child: TextFormField(
                                              controller: arm,
                                              maxLength: 3,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              onSaved: (value) {
                                                controllerget.arm =
                                                    int.parse(value!);
                                              },
                                              validator: (value) {
                                                return "Optional";
                                              },
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp),
                                              textAlign:
                                              TextAlign.center,
                                              decoration:
                                              InputDecoration(
                                                errorStyle:
                                                const TextStyle(
                                                    color: Colors
                                                        .blueAccent),
                                                focusedErrorBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent)),
                                                errorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .blueAccent),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius
                                                          .circular(
                                                          12)),
                                                ),
                                                border: const OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        12))),
                                                fillColor: const Color(
                                                    0xff1f1f1F),
                                                filled: true,
                                                hintText: "29".tr,
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /// CALVES
                                        Center(
                                          child: SizedBox(
                                            height: 70.h,
                                            width: 100.w,
                                            child: TextFormField(
                                              controller: calve,
                                              maxLength: 3,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              onSaved: (value) {
                                                controllerget.calve =
                                                    int.parse(value!);
                                              },
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp),
                                              textAlign:
                                              TextAlign.center,
                                              decoration:
                                              InputDecoration(
                                                errorStyle:
                                                const TextStyle(
                                                    color: Colors
                                                        .blueAccent),
                                                focusedErrorBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent)),
                                                errorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .blueAccent),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius
                                                          .circular(
                                                          12)),
                                                ),
                                                border: const OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        12))),
                                                fillColor: const Color(
                                                    0xff1f1f1F),
                                                filled: true,
                                                hintText: "30".tr,
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ):Column(
                                      children: [

                                        /// Waist
                                        Form(key: formkey4,
                                          child: Center(
                                            child: SizedBox(
                                              height: 70.h,
                                              width: 100.w,
                                              child: TextFormField(
                                                controller: waist,
                                                maxLength: 3,
                                                keyboardType:
                                                TextInputType.number,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                onSaved: (value) {
                                                  controllerget.waist =
                                                      int.parse(value!);
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "33".tr;
                                                  }
                                                  return null;
                                                },
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  errorStyle:
                                                  const TextStyle(
                                                      color: Colors
                                                          .blueAccent),
                                                  focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blueAccent)),
                                                  errorBorder:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            12)),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius
                                                              .circular(
                                                              12))),
                                                  fillColor: const Color(
                                                      0xff1f1f1F),
                                                  filled: true,
                                                  hintText: "27".tr,
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /// NECK
                                        Form(key: formkey3,
                                          child: Center(
                                            child: SizedBox(
                                              height: 70.h,
                                              width: 100.w,
                                              child: TextFormField(
                                                 controller: neck,
                                                maxLength: 3,
                                                keyboardType:
                                                TextInputType.number,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                onSaved: (value) {
                                                  controllerget.neck =
                                                      int.parse(value!);
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "33".tr;
                                                  }
                                                  return null;
                                                },
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  errorStyle:
                                                  const TextStyle(
                                                      color: Colors
                                                          .blueAccent),
                                                  focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blueAccent)),
                                                  errorBorder:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            12)),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius
                                                              .circular(
                                                              12))),
                                                  fillColor: const Color(
                                                      0xff1f1f1F),
                                                  filled: true,
                                                  hintText: "28".tr,
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /// Hip
                                        Form(key: formkey5,
                                          child: Center(
                                            child: SizedBox(
                                              height: 70.h,
                                              width: 100.w,
                                              child: TextFormField(
                                                controller: hip,
                                                maxLength: 3,
                                                keyboardType:
                                                TextInputType.number,
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                onSaved: (value) {
                                                  controllerget.hip =
                                                      int.parse(value!);
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "33".tr;
                                                  }
                                                  return null;
                                                },
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  errorStyle:
                                                  const TextStyle(
                                                      color: Colors
                                                          .blueAccent),
                                                  focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blueAccent)),
                                                  errorBorder:
                                                  const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            12)),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius
                                                              .circular(
                                                              12))),
                                                  fillColor: const Color(
                                                      0xff1f1f1F),
                                                  filled: true,
                                                  hintText: "31".tr,
                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///Chest
                                        Center(
                                          child: SizedBox(
                                            height: 70.h,
                                            width: 100.w,
                                            child: TextFormField(
                                              controller: chest,
                                              maxLength: 3,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              onSaved: (value) {
                                                controllerget.chest =
                                                    int.parse(value!);
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "33".tr;
                                                }
                                                return null;
                                              },
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                errorStyle:
                                                const TextStyle(
                                                    color: Colors
                                                        .blueAccent),
                                                focusedErrorBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent)),
                                                errorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .blueAccent),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          12)),
                                                ),
                                                border: const OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            12))),
                                                fillColor: const Color(
                                                    0xff1f1f1F),
                                                filled: true,
                                                hintText: "32".tr,
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Center(
                                          child: SizedBox(
                                            height: 70.h,
                                            width: 100.w,
                                            child: TextFormField(
                                              maxLength: 3,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              onSaved: (value) {
                                                controllerget.calve =
                                                    int.parse(value!);
                                              },
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                errorStyle:
                                                const TextStyle(
                                                    color: Colors
                                                        .blueAccent),
                                                focusedErrorBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .blueAccent)),
                                                errorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .blueAccent),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          12)),
                                                ),
                                                border: const OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius
                                                            .circular(
                                                            12))),
                                                fillColor: const Color(
                                                    0xff1f1f1F),
                                                filled: true,
                                                hintText: "30".tr,
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),



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
                                        onPressed: () {

                                          if(controllerget.isSelectedMan){
                                          controllerget.submitForm(formkey,formkey2,formkey3,formkey4,formkey5);
                                          controllerget.submitForm(formkey2,formkey,formkey3,formkey4,formkey5);
                                          }else{
                                            controllerget.submitForm(formkey3,formkey3,formkey3,formkey3,formkey3);
                                            controllerget.submitForm(formkey4,formkey4,formkey4,formkey4,formkey4);
                                            controllerget.submitForm(formkey5,formkey5,formkey5,formkey5,formkey5);
                                          }
                                          if (controllerget.neck != 0 &&
                                              controllerget.waist != 0) {
                                            controller.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.easeInOut);
                                          }
                                        },
                                        child:  Text("0".tr,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      /// FIND PREFERED FOODS
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: Container(
                          padding: EdgeInsets.symmetric(horizontal: 22.h),
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 25.h),
                                  child:  Text("34".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                  padding: EdgeInsets.only(top: 45.h),
                                  child:  Text(
                                      "35".tr,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Container(
                                padding: EdgeInsets.only(top: 100.h),
                                child: SizedBox(
                                  height: 50.h,
                                  child: TextFormField(
                                    controller: searchcontroller,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      fillColor: const Color(0xff1f1f1F),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          )),
                                    ),
                                    autofocus: false,
                                    onChanged: (value) {
                                      controllerget.filterSearchResults(value);
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 170.h),
                                child: SizedBox(
                                  height: 300.h,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // عدد الأعمدة
                                      crossAxisSpacing:
                                          2, // المسافة الأفقية بين العناصر
                                      mainAxisSpacing:
                                          12, // المسافة العمودية بين العناصر
                                      childAspectRatio:
                                          3.5, // نسبة العرض إلى الارتفاع لكل عنصر
                                    ),
                                    itemCount:
                                        controllerget.filteredList.length,
                                    itemBuilder: (context, index) {
                                      return MaterialButton(
                                        onLongPress: () {
                                          showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return Container(
                                                  margin: EdgeInsets.only(
                                                      top: 350.h,
                                                      bottom: 120.h),
                                                  child: Scaffold(
                                                    backgroundColor:
                                                        Colors.white,
                                                  ));
                                            },
                                          );
                                        },
                                        color: controllerget
                                                .filteredList[index].isSelected!
                                            ? Colors.blueAccent
                                            : const Color(0xff1f1f1F),
                                        height: 50.h,
                                        splashColor: Colors.blueAccent,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        onPressed: () {
                                          if (controllerget.filteredList[index]
                                                  .isFirstClick ==
                                              false) {
                                            controllerget.filteredList[index]
                                                .isFirstClick = true;
                                            controllerget.filteredList[index]
                                                .isSelected = true;
                                            controllerget.getNutritionFacts(
                                                controllerget.foodContent);
                                            controllerget.CategorizationFood();
                                            controllerget
                                                    .AllProteinIntakeEveryAmountOfFoods
                                                .forEach((key, value) {
                                              controllerget.foodquantities
                                                  .addIf(
                                                      controllerget
                                                              .filteredList[
                                                                  index]
                                                              .isSelected ==
                                                          true,
                                                      controllerget
                                                          .filteredList[index]
                                                          .foodName!
                                                          .toLowerCase(),
                                                      value);
                                              controllerget.update();
                                            });

                                            controllerget.BodyNeeds();
                                            //controllerget.foodQuantities();

                                            controllerget.update();
                                          } else if (controllerget
                                                  .filteredList[index]
                                                  .isFirstClick ==
                                              true) {
                                            controllerget.filteredList[index]
                                                .isFirstClick = false;
                                            controllerget.filteredList[index]
                                                .isSelected = false;
                                            controllerget.getNutritionFacts(
                                                controllerget.foodContent);
                                            controllerget.CategorizationFood();
                                            controllerget.HighProteinFoods
                                                .removeWhere((key, value) =>
                                                    key ==
                                                    controllerget
                                                        .filteredList[index]
                                                        .foodName!
                                                        .toLowerCase());
                                            controllerget.HighCarbFoods
                                                .removeWhere((key, value) =>
                                                    key ==
                                                    controllerget
                                                        .filteredList[index]
                                                        .foodName!
                                                        .toLowerCase());
                                            controllerget.HighFatFoods
                                                .removeWhere((key, value) =>
                                                    key ==
                                                    controllerget
                                                        .filteredList[index]
                                                        .foodName!
                                                        .toLowerCase());
                                            controllerget
                                                    .AllProteinIntakeEveryAmountOfFoods
                                                .removeWhere((key, value) =>
                                                    key ==
                                                    controllerget
                                                        .filteredList[index]
                                                        .foodName!
                                                        .toLowerCase());
                                            controllerget
                                                    .AllCarbIntakeEveryAmountOfFoods
                                                .removeWhere((key, value) =>
                                                    key ==
                                                    controllerget
                                                        .filteredList[index]
                                                        .foodName!
                                                        .toLowerCase());
                                            controllerget
                                                    .AllFatIntakeEveryAmountOfFoods
                                                .removeWhere((key, value) =>
                                                    key ==
                                                    controllerget
                                                        .filteredList[index]
                                                        .foodName!
                                                        .toLowerCase());
                                            controllerget.foodquantities
                                                .removeWhere((key, value) =>
                                                    key ==
                                                    controllerget
                                                        .filteredList[index]
                                                        .foodName!
                                                        .toLowerCase());
                                            controllerget.update();
                                            controllerget.getNutritionFacts(
                                                controllerget.foodContent);
                                            controllerget.BodyNeeds();
                                            controllerget.update();
                                          }

                                          if (controllerget
                                                  .HighProteinFoods.isEmpty ||
                                              controllerget
                                                  .HighCarbFoods.isEmpty ||
                                              controllerget
                                                  .HighFatFoods.isEmpty) {
                                            controllerget.pathway2 = false;
                                            controllerget.update();
                                          } else {
                                            controllerget.pathway2 = true;
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${controllerget.filteredList[index].foodName}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                      
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              controllerget.pathway2 == true
                                  ? Container(
                                      padding: EdgeInsets.only(top: 350.h),
                                      child: Center(
                                        child: MaterialButton(
                                          color:   Color(0xff1f1f1F),
                                          minWidth: 155,
                                          height: 45.h,
                                          splashColor: Colors.blueAccent,
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          onPressed: () {
                                            for (var element
                                                in controllerget.filteredList) {
                                              if (element.isSelected == true) {
                                                controllerget.namelist
                                                    .add(element);

                                              }
                                            }
                                             controllerget
                                                .CalculateAmountsFood();
                                            controllerget.foodQuantities();
                                            controllerget.update();
                                            controllerget.ResponsiveQuantity();
                                            controllerget.gg();
                                            controller.nextPage(duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
                                            Get.back();

                                            // showDialog(
                                            //     context: context,
                                            //     builder: (context) =>
                                            //         CupertinoAlertDialog(
                                            //           title: Text("36".tr,
                                            //               style: TextStyle(fontSize: 14.sp)),
                                            //           content: Text(
                                            //               "37".tr,
                                            //               style: TextStyle(fontSize: 11.sp)),
                                            //           actions: [
                                            //             MaterialButton(
                                            //                 onPressed: () {
                                            //                   controller.nextPage(
                                            //                       duration: const Duration(
                                            //                           milliseconds: 500),
                                            //                       curve: Curves.easeInOut);
                                            //                   Get.back();
                                            //                 },
                                            //                 child:
                                            //                  Text("38".tr)),
                                            //             MaterialButton(
                                            //                 onPressed: () {
                                            //                   controller.animateToPage(9,
                                            //                       duration: const Duration(
                                            //                           milliseconds: 500),
                                            //                       curve: Curves.easeInOut);
                                            //                   Get.back();
                                            //                 },
                                            //                 child:Text("39".tr))
                                            //           ],
                                            //         ));
                                          },
                                          child:Text("0".tr,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ))
                                  : const Text(""),
                            ],
                          ),
                        ),
                      ),
                      /// ADJUST QUANTITIES
                      // Scaffold(
                      //   appBar: CustomAppBar(),
                      //   backgroundColor: Colors.black,
                      //   body: Container(
                      //     padding: EdgeInsets.symmetric(horizontal: 22.w),
                      //     child: Stack(
                      //       children: [
                      //         Container(
                      //             padding: EdgeInsets.only(top: 22.h),
                      //             child:Text(
                      //                 "40".tr,
                      //                 style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontWeight: FontWeight.bold))),
                      //         Container(
                      //           padding: EdgeInsets.only(top: 60.h),
                      //           child: Column(
                      //             children: [
                      //               Center(
                      //                   child: Container(
                      //                 width: MediaQuery.of(context).size.width,
                      //                 height: 95.h,
                      //                 decoration: const BoxDecoration(
                      //                     color: Color(0xff1f1f1F),
                      //                     borderRadius: BorderRadius.horizontal(
                      //                         right: Radius.circular(22),
                      //                         left: Radius.circular(22))),
                      //                 child: Column(
                      //                   children: [
                      //                     Container(
                      //                       padding: EdgeInsets.symmetric(
                      //                           horizontal: 22.w),
                      //                       height: 45.h,
                      //                       decoration: BoxDecoration(
                      //                           borderRadius:
                      //                               BorderRadius.circular(12),
                      //                           color: Colors.white),
                      //                       child: Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment
                      //                                   .spaceEvenly,
                      //                           children: [
                      //                             Text(
                      //                               "41".tr,
                      //                               style: TextStyle(
                      //                                   color: Colors.black,
                      //                                   fontSize: 11.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                             Text(
                      //                               "42".tr,
                      //                               style: TextStyle(
                      //                                   color: Colors.black,
                      //                                   fontSize: 11.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                             Text(
                      //                               "43".tr,
                      //                               style: TextStyle(
                      //                                   color: Colors.black,
                      //                                   fontSize: 11.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                             Text(
                      //                               "44".tr,
                      //                               style: TextStyle(
                      //                                   color: Colors.black,
                      //                                   fontSize: 11.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                           ]),
                      //                     ),
                      //                     Padding(
                      //                       padding: EdgeInsets.symmetric(
                      //                           vertical: 15.h,
                      //                           horizontal: 20.w),
                      //                       child: Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.spaceEvenly,
                      //                         children: [
                      //                           Padding(
                      //                             padding: EdgeInsets.only(
                      //                                 left: 8.w),
                      //                             child: Text(
                      //                               "${controllerget.Tdee.round()}",
                      //                               style: TextStyle(
                      //                                   color: Colors.white,
                      //                                   fontSize: 11.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                           ),
                      //                           Padding(
                      //                             padding: EdgeInsets.only(
                      //                                 left: 10.w),
                      //                             child: Text(
                      //                               "${controllerget.targetProtein.round()} g",
                      //                               style: TextStyle(
                      //                                   color: Colors.white,
                      //                                   fontSize: 11.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                           ),
                      //                           Padding(
                      //                             padding: EdgeInsets.only(
                      //                                 left: 10.w),
                      //                             child: Text(
                      //                               "${controllerget.targetCarbs.round()} g",
                      //                               style: TextStyle(
                      //                                   color: Colors.white,
                      //                                   fontSize: 11.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold),
                      //                             ),
                      //                           ),
                      //                           Text(
                      //                             "${controllerget.targetFat.round()} g",
                      //                             style: TextStyle(
                      //                                 color: Colors.white,
                      //                                 fontSize: 11.sp,
                      //                                 fontWeight:
                      //                                     FontWeight.bold),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               )),
                      //             ],
                      //           ),
                      //         ),
                      //         Container(
                      //           padding: EdgeInsets.only(top: 190.h),
                      //           child: Center(
                      //             child: Column(
                      //               children: [
                      //                 Expanded(
                      //                   child: ListView.builder(
                      //                     shrinkWrap: true,
                      //                     itemCount: controllerget
                      //                         .foodquantities.length,
                      //                     itemBuilder: (context, index) {
                      //                       return Container(
                      //                         padding: const EdgeInsets.only(
                      //                             bottom: 50),
                      //                         child: Column(
                      //                           children: [
                      //                             Text(
                      //                               "${controllerget.namelist[index].foodName?.toLowerCase()} : ${controllerget.foodquantities["${controllerget.namelist[index].foodName?.toLowerCase()}"]?.round()} g",
                      //                               style: const TextStyle(
                      //                                   color: Colors.white),
                      //                             ),
                      //                             SliderTheme(
                      //                               data: SliderThemeData(
                      //                                 thumbShape:
                      //                                     SliderComponentShape
                      //                                         .noOverlay,
                      //                                 trackHeight: 10,
                      //                                 thumbColor:
                      //                                     Colors.blueAccent,
                      //                                 trackShape:
                      //                                     const RoundedRectSliderTrackShape(),
                      //                                 activeTrackColor:
                      //                                     Colors.blueAccent,
                      //                               ),
                      //                               child: Slider(
                      //                                 value: controllerget
                      //                                         .foodquantities[
                      //                                     "${controllerget.namelist[index].foodName?.toLowerCase()}"]!,
                      //                                 min: controllerget
                      //                                             .foodquantitiessaver[
                      //                                         "${controllerget.namelist[index].foodName?.toLowerCase()}"]! *
                      //                                     .20,
                      //                                 max: 2 *
                      //                                     controllerget
                      //                                             .foodquantitiessaver[
                      //                                         "${controllerget.namelist[index].foodName?.toLowerCase()}"]!,
                      //                                 onChanged: (v) {
                      //                                   controllerget
                      //                                           .foodquantities[
                      //                                       "${controllerget.namelist[index].foodName?.toLowerCase()}"] = v;
                      //                                  // controllerget.Clasifications();
                      //
                      //                                   controllerget
                      //                                       .CalculateAmountsFood();controllerget.update();
                      //                                   controllerget.ResponsiveQuantity();
                      //
                      //
                      //                                   controllerget.update();
                      //                                 },
                      //                                 onChangeStart: (value) {
                      //                                   controllerget.bz ==
                      //                                           false
                      //                                       ? showDialog(
                      //                                           context:
                      //                                               context,
                      //                                           builder:
                      //                                               (context) =>
                      //                                                   CupertinoAlertDialog(
                      //                                                     title: Text(
                      //                                                         "Are You Serious",
                      //                                                         style: TextStyle(fontSize: 14.sp)),
                      //                                                     content: Text(
                      //                                                         "You're Changing Food Quantities\n On Your Own",
                      //                                                         style: TextStyle(fontSize: 11.sp)),
                      //                                                     actions: [
                      //                                                       MaterialButton(
                      //                                                           onPressed: () {
                      //                                                             controllerget.bz ? Get.back() : controllerget.bz = true;
                      //                                                           },
                      //                                                           child: const Text("Yes, on My Own")),
                      //                                                       MaterialButton(
                      //                                                           onPressed: () {
                      //
                      //                                                               controller
                      //                                                                   .nextPage(
                      //                                                                   duration: const Duration(
                      //                                                                       milliseconds: 500),
                      //                                                                   curve: Curves
                      //                                                                       .easeInOut);
                      //
                      //                                                             Get.back();
                      //                                                           },
                      //                                                           child: const Text("No"))
                      //                                                     ],
                      //                                                   ))
                      //                                       : const Text("");
                      //                                 },
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       );
                      //                     },
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      /// FOOD REPORT
                      Scaffold(
                        appBar: CustomAppBar(),
                        backgroundColor: Colors.black,
                        body: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            child: Stack(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(top: 22.h),
                                    child:Text("45".tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                  padding: EdgeInsets.only(top: 60.h),
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 460.h,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff1f1f1F),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    right: Radius.circular(22),
                                                    left: Radius.circular(22))),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 22.w),
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.white),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "46".tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "42".tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "43".tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "44".tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ]),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.h,
                                                  horizontal: 20.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.w),
                                                    child: Text(
                                                      "${controllerget.Tdee.round()}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
                                                    child: Text(
                                                      "${controllerget.targetProtein.round()} g",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
                                                    child: Text(
                                                      "${controllerget.targetCarbs.round()} g",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${controllerget.targetFat.round()} g",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors
                                                  .grey, // Set the color of the line (default is Colors.grey)
                                              thickness:
                                                  1.0, // Set the thickness of the line (default is 0.5)
                                              height:
                                                  20, // Set the height of the line (default is 16)
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                padding: EdgeInsets.only(
                                                    bottom: 0, top: 20.h),
                                                shrinkWrap: false,
                                                itemCount: controllerget
                                                    .foodquantities.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.h),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "${controllerget.namelist[index].foodName} : ${controllerget.foodquantities["${controllerget.namelist[index].foodName?.toLowerCase()}"]!.round()} g",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 22.w,
                                                          ),
                                                          height: 25.h,
                                                          width: 300,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              color:
                                                                  Colors.white),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Text(
                                                                  "41".tr,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  "42".tr,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  "43".tr,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  "44".tr,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ]),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      15.h,
                                                                  horizontal:
                                                                      20.w),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 8
                                                                            .w),
                                                                child: Text(
                                                                  (controllerget
                                                                              .namelist[
                                                                                  index]
                                                                              .calories! *
                                                                          (controllerget.foodquantities[
                                                                              '${controllerget.namelist[index].foodName?.toLowerCase()}']!))
                                                                      .toStringAsFixed(
                                                                          1),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 10
                                                                            .w),
                                                                child: Text(
                                                                  (controllerget
                                                                              .namelist[
                                                                                  index]
                                                                              .protein! *
                                                                          (controllerget.foodquantities[
                                                                              '${controllerget.namelist[index].foodName?.toLowerCase()}']!))
                                                                      .toStringAsFixed(
                                                                          1),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 10
                                                                            .w),
                                                                child: Text(
                                                                  (controllerget
                                                                              .namelist[
                                                                                  index]
                                                                              .carbohydrate! *
                                                                          (controllerget.foodquantities[
                                                                              '${controllerget.namelist[index].foodName?.toLowerCase()}']!))
                                                                      .toStringAsFixed(
                                                                          1),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Text(
                                                                ((controllerget
                                                                            .namelist[
                                                                                index]
                                                                            .fat!) *
                                                                        (controllerget.foodquantities[
                                                                            '${controllerget.namelist[index].foodName?.toLowerCase()}']!))
                                                                    .toStringAsFixed(
                                                                        1),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        index + 1 ==
                                                                controllerget
                                                                    .foodquantities
                                                                    .length
                                                            ? Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            22.w),
                                                                height: 60.h,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    color: Colors
                                                                        .white),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "45".tr,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 11.sp,
                                                                              fontWeight: FontWeight.bold),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Text(
                                                                            "41".tr,
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 11.sp,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            "42".tr,
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 11.sp,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            "43".tr,
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 11.sp,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                            "44".tr,
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 11.sp,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ]),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 25.w),
                                                                            child: Text(
                                                                              "${controllerget.calfpro.round() + controllerget.calfcarb.round() + controllerget.calffat.round()}",
                                                                              style: TextStyle(color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.bold),
                                                                            )),
                                                                        Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 60.w),
                                                                            child: Text(
                                                                              "${controllerget.profpro.round() + controllerget.profcarb.round() + controllerget.proffat.round()}",
                                                                              style: TextStyle(color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.bold),
                                                                            )),
                                                                        Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 52.w),
                                                                            child: Text(
                                                                              "${controllerget.carbfpro.round() + controllerget.carbfcarb.round() + controllerget.carbffat.round()}",
                                                                              style: TextStyle(color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.bold),
                                                                            )),
                                                                        Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 44.w),
                                                                            child: Text(
                                                                              "${controllerget.fatfpro.round() + controllerget.fatfcarb.round() + controllerget.fatffat.round()}",
                                                                              style: TextStyle(color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.bold),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            : const Divider(
                                                                color: Colors
                                                                    .grey, // Set the color of the line (default is Colors.grey)
                                                                thickness:
                                                                    1.0, // Set the thickness of the line (default is 0.5)
                                                                height:
                                                                    20, // Set the height of the line (default is 16)
                                                              ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),

                /// PROGRESSIVE LINE INDICATOR
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .85),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                            if (controller.page == 9) {
                              if (controllerget.pathway2 == false) {
                                controller.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              } else {
                                controller.animateToPage(7,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }
                            }
                          },
                          icon: getIconBackchervon(),
                          color: Colors.white,
                        ),
                        SmoothPageIndicator(
                          controller: controller,
                          count: 9,
                          effect: const SwapEffect(
                            paintStyle: PaintingStyle.fill,
                            spacing: 0,
                            dotWidth: 28,
                            radius: double.minPositive,
                            activeDotColor: Colors.blueAccent,
                            dotColor: Colors.white,
                            strokeWidth:
                                0, // Set border width to 0 to remove the border
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (controller.page == 0 &&
                                    controllerget.isSelectedMan == true ||controller.page == 0 &&
                                controllerget.isSelectedWoMan == true) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else if (controller.page == 1 &&
                                    controllerget.isSelectedLoseWheight ==
                                        true ||
                                controller.page == 1 &&
                                    controllerget.isSelectedMentainWheight ==
                                        true ||
                                controller.page == 1 &&
                                    controllerget.isSelectedGainWheight ==
                                        true) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else if (controller.page == 2 &&
                                    controllerget.isLowActivitySelected ==
                                        true ||
                                controller.page == 2 &&
                                    controllerget.isLightActivitySelected ==
                                        true ||
                                controller.page == 2 &&
                                    controllerget.isModerateActivitySelected ==
                                        true ||
                                controller.page == 2 &&
                                    controllerget.isHeavyActivitySelected ==
                                        true ||
                                controller.page == 2 &&
                                    controllerget.isExtreemActivitySelected ==
                                        true) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else if (controller.page == 3) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else if (controller.page == 4 &&
                                controllerget.pathway == true &&
                                controllerget.Tall > 0 &&
                                controllerget.Weight > 0) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else if (controller.page == 5 &&
                                    controllerget.Poormoney == true ||
                                controller.page == 5 &&
                                    controllerget.Richmoney == true ||
                                controller.page == 5 &&
                                    controllerget.Mediummoney == true) {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else if (controller.page == 6) {
                              if(controllerget.isSelectedMan){
                                controllerget.submitForm(formkey,formkey2,formkey3,formkey4,formkey5);
                                controllerget.submitForm(formkey2,formkey,formkey3,formkey4,formkey5);
                              }else{
                                controllerget.submitForm(formkey3,formkey3,formkey3,formkey3,formkey3);
                                controllerget.submitForm(formkey4,formkey4,formkey4,formkey4,formkey4);
                                controllerget.submitForm(formkey5,formkey5,formkey5,formkey5,formkey5);
                              }
                              if (controllerget.neck != 0 &&
                                  controllerget.waist != 0) {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }else{}
                            } else if (controller.page == 7 &&
                                controllerget.pathway2 == true) {
                              controllerget.CalculateAmountsFood();
                              controllerget.foodQuantities();
                              controllerget.update();
                              controller.nextPage(
                                  duration: const Duration(
                                      milliseconds: 500),
                                  curve: Curves.easeInOut);
                              Get.back();
                              // showDialog(
                              //     context: context,
                              //     builder: (context) => CupertinoAlertDialog(
                              //           title: Text("Adjust Quantities",
                              //               style: TextStyle(fontSize: 14.sp)),
                              //           content: Text(
                              //               "Change Quantities On Your Own  \n Or Let me Do It For You",
                              //               style: TextStyle(fontSize: 11.sp)),
                              //           actions: [
                              //             MaterialButton(
                              //                 onPressed: () {
                              //                   controller.nextPage(
                              //                       duration: const Duration(
                              //                           milliseconds: 500),
                              //                       curve: Curves.easeInOut);
                              //                   Get.back();
                              //                 },
                              //                 child:
                              //                     const Text("Yes, on My Own")),
                              //             MaterialButton(
                              //                 onPressed: () {
                              //                   controller.animateToPage(9,
                              //                       duration: const Duration(
                              //                           milliseconds: 500),
                              //                       curve: Curves.easeInOut);
                              //                   Get.back();
                              //                 },
                              //                 child: const Text("No"))
                              //           ],
                              //         ));
                            } else if (controller.page == 8) {
                              mybox!.put("Tdee", controllerget.Tdee);
                              mybox!.put("targetProtien", controllerget.targetProtein);
                              mybox!.put("targetCarb", controllerget.targetCarbs);
                              mybox!.put("targetFat", controllerget.targetFat);
                              mybox!.put("foodQuantity", controllerget.foodquantities);
                              mybox!.put("filterdList", controllerget.namelist);
                              mybox!.put("calofProtien", controllerget.calfpro);
                              mybox!.put("calofCarb", controllerget.calfcarb);
                              mybox!.put("calofFat", controllerget.calffat);
                              mybox!.put("protienofProtien", controllerget.profpro);
                              mybox!.put("protienofCarb", controllerget.profcarb);
                              mybox!.put("protienofFat", controllerget.proffat);
                              mybox!.put("carbofProtien", controllerget.carbfpro);
                              mybox!.put("carbofCarb", controllerget.carbfcarb);
                              mybox!.put("carbofFat", controllerget.carbffat);
                              mybox!.put("fatofProtien", controllerget.fatfpro);
                              mybox!.put("fatofCarb", controllerget.fatfcarb);
                              mybox!.put("fatofFat", controllerget.fatffat);

                              if (Tdee > 0) {
                                //myServices.sharedPreferences.setBool("Finsh", true);
                                controllerget.namelist.forEach((element) {
                                  st+=""" 
                                   foodName:${element.foodName}\n
                                   calories:${element.calories}\n
                                   protein:${element.protein}\n
                                   carbohydrate:${element.carbohydrate}\n
                                   fat:${element.fat}\n
                                   isFirstClick:${element.isFirstClick}\n
                                   isSelected:${element.isSelected}""";
                                });

                                insertUserData(controllerget.isSelectedLoseWheight?1.toString():0.toString(), controllerget.isSelectedLoseWheight?0.toString():controllerget.isSelectedMentainWheight?1.toString():2.toString(), controllerget.isLowActivitySelected?0.toString():controllerget.isLightActivitySelected?1.toString():controllerget.isModerateActivitySelected?2.toString():3.toString(),dateofbirth?.toIso8601String().toString(),controllerget.Weight.toString(),controllerget.Tall.toString(),controllerget.Poormoney?0.toString():controllerget.Mediummoney?1.toString():2.toString(),waist.text.toString(),neck.text.toString(),hip.text.toString(),controllerget.Tdee.toString(),controllerget.s.toString(), controllerget.targetProtein.toString(),controllerget.targetCarbs.toString(),controllerget.targetFat.toString(),controllerget.foodquantities.toString(),st.toString(),controllerget.calfpro.toString(),controllerget.calfcarb.toString(),controllerget.calffat.toString(),controllerget.profpro.toString(),controllerget.profcarb.toString(),controllerget.proffat.toString(),controllerget.carbfpro.toString(),controllerget.carbfcarb.toString(),controllerget.carbffat.toString(),controllerget.fatfpro.toString(),controllerget.fatfcarb.toString(),controllerget.fatffat.toString());
                              }

                             Get.offAll(  HomePage());
                              if (Tdee > 0) {

                                Get.offAll(  HomePage());
                                Get.offAll(HomePage());
                              }
                            }
                          },
                          icon:getIconBasedOnLanguage(),

                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


Icon getIconBasedOnLanguage() {
  if (langcontroller.language== Locale("en")) {
    return Icon(CupertinoIcons.chevron_forward);
  } else  {
    return Icon(CupertinoIcons.chevron_back);
  }
}

Icon getIconBackchervon() {
  if (langcontroller.language== Locale("en")) {
    return Icon(CupertinoIcons.chevron_back);
  } else  {
    return Icon(CupertinoIcons.chevron_forward);
  }
}
