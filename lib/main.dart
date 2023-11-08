import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:coachiko/core/localization/changelocal.dart';
import 'package:coachiko/core/localization/translation.dart';
import 'package:coachiko/view/screens/HomePage.dart';
import 'package:coachiko/view/screens/OnBoarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'core/services/auth_services.dart';
import 'core/services/services.dart';
import 'data/models/foodModel.dart';
import 'data/models/recipesModel.dart';
import 'firebase_options.dart';
import 'view/screens/AuthFork.dart';
import 'view/screens/auth/login.dart';
import 'package:timezone/data/latest.dart' as tz;

AuthService authService = AuthService();

Box? mybox;
Future<Box> openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(boxname);
}
LocaleController a = LocaleController();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
MyServices myServices = Get.find();
var data;
Map<String, double> jsonData = {};
List<foodDataModel> foodItems = [];

void main() async {

   WidgetsFlutterBinding.ensureInitialized();
   await initialServices();

  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.init(appDocumentDirectory.path);
  }

  Hive.registerAdapter(FoodDataModelAdapter(),);
  Hive.registerAdapter(RecipeDataModelAdapter(),);
  mybox = await openHiveBox("client");


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
LocaleController langcontroller = Get.put(LocaleController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return  GetMaterialApp(
          locale: langcontroller.language,
          translations: MyTranslation(),
          localizationsDelegates: [


           ],
         // home: OnboardingScreen(),
           initialRoute: myServices.sharedPreferences.getBool("goHome")==null?"/authpage":"/homepage",
           routes:{
                "/authpage":(context)=>AuthPage(),
                "/login":(context)=>LoginScreen(),
                "/onboarding":(context)=>OnboardingScreen(),
                "/homepage":(context)=>HomePage(),},

          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
