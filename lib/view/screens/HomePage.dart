import 'package:coachiko/view/screens/AuthFork.dart';
import 'package:coachiko/view/screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../controller/homeController.dart';
import '../../core/notification/notfication.dart';
import '../../core/services/auth_services.dart';
import '../../customAppBar.dart';
 import '../../main.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../widgets/custom_material_button.dart';
HomeController homeController = HomeController();


final double Tdee = mybox!.get("Tdee");
final double targetProtien = mybox!.get("targetProtien");
final double TargetCarb = mybox!.get("targetCarb");
final double Targetfat = mybox!.get("targetFat");
final Map<dynamic,dynamic> foodquantities = mybox!.get("foodQuantity") ;
final List <dynamic> filteredList = mybox!.get("filterdList");
 double calofProtien = mybox!.get("calofProtien");
 double calofCarb = mybox!.get("calofCarb");
 double calofFat = mybox!.get("calofFat");
 double protienofProtien = mybox!.get("protienofProtien");
 double protienofCarb = mybox!.get("protienofCarb");
 int protienofFat = mybox!.get("protienofFat");
 double carbofProtien = mybox!.get("carbofProtien");
 double carbofCarb = mybox!.get("carbofCarb");
 double carbofFat = mybox!.get("carbofFat");
 double fatofProtien = mybox!.get("fatofProtien");
 double fatofCarb = mybox!.get("fatofCarb");
 double fatofFat = mybox!.get("fatofFat");
var recipeFilterd = mybox!.put("recipeFilterd", homeController.recipeFilterd);

bool checkbox=false;

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex=0;

final pages = [const Home1(),Home2() , Home3() , const Home4(), ];

@override
  void initState() {

  super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
             body:  pages[selectedindex],
              bottomNavigationBar:  Container(
                padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
                child: GNav(
                    rippleColor: Colors.grey.shade800, hoverColor: Colors.grey.shade700, haptic: true,tabBorderRadius: 10,
                    tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8)], gap: 8, curve: Curves.bounceIn,
                    color: Colors.grey[800], activeColor: Colors.white, iconSize: 24,tabBackgroundColor: Colors.black.withOpacity(0.1),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    tabs:  [
                      GButton(
                        icon: Icons.home,
                        text: '47'.tr,
                      ),
                      GButton(
                        icon: Icons.set_meal_rounded,
                        text: '48'.tr,
                      ),
                      GButton(
                        icon: Icons.stacked_line_chart,
                        text: '49'.tr,
                      ),
                      GButton(
                        icon: Icons.account_box_outlined,
                        text: '50'.tr,
                      )
                    ],
                selectedIndex: selectedindex,
                    onTabChange: (value) {
                      setState(() {
                        selectedindex=value;

                      });

  },

                ),
              )


    );}}



class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,appBar:CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Stack(
              children: [

                Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      Center(child: Container(width: MediaQuery
                          .of(context)
                          .size
                          .width, height: 460.h,
                        decoration: const BoxDecoration(color: Color(0xff1f1f1F),
                            borderRadius: BorderRadius.horizontal(right: Radius
                                .circular(22), left: Radius.circular(22))),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            height: 45.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("46".tr, style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),),
                                  Text("42".tr, style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),),
                                  Text("43".tr, style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),),
                                  Text("44".tr, style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),),


                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text("${mybox!.get("Tdee").round()}", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text("${mybox!.get("targetProtien").round()} g",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text("${mybox!.get("targetCarb").round()} g",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold),),
                                ),
                                Text("${mybox!.get("targetFat").round()} g", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold),),

                              ],),),

                          MaterialButton(onPressed: (){print(mybox!.get("protienofFat"));},
                            child: const Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                              height: 20,
                            ),
                          ),


                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 0, top: 20.h),
                              shrinkWrap: true,

                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: Column(
                                    children: [
                                      Text("${mybox!.get("filterdList")[index].foodName} : ${mybox!.get("foodQuantity")["${mybox!.get("filterdList")[index].foodName?.toLowerCase()}"]?.round()} g", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Container(padding: EdgeInsets.symmetric(
                                        horizontal: 22.w,),
                                        height: 25.h,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                6), color: Colors.white),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround, children: [

                                          Text("41".tr, style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold),),
                                          Text("42".tr, style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold),),
                                          Text("43".tr, style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold),),
                                          Text("44".tr, style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold),),

                                        ]),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.h, horizontal: 20.w),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly, children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.w),
                                            child: Text(
                                              (mybox!.get("filterdList")[index].calories! *
                                                  (mybox!.get("foodQuantity")['${mybox!.get("filterdList")[index]
                                                      .foodName
                                                      ?.toLowerCase()}']!))
                                                  .toStringAsFixed(1),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(left: 10.w),
                                            child: Text(
                                              (mybox!.get("filterdList")[index].protein! *
                                                  (mybox!.get("foodQuantity")['${mybox!.get("filterdList")[index]
                                                      .foodName
                                                      ?.toLowerCase()}']!))
                                                  .toStringAsFixed(1),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.w),
                                            child: Text(
                                              (mybox!.get("filterdList")[index].carbohydrate! *
                                                  (mybox!.get("foodQuantity")['${mybox!.get("filterdList")[index]
                                                      .foodName
                                                      ?.toLowerCase()}']!))
                                                  .toStringAsFixed(1),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),),
                                          ),
                                          Text(((mybox!.get("filterdList")[index].fat!) *
                                              (mybox!.get("foodQuantity")['${mybox!.get("filterdList")[index]
                                                  .foodName?.toLowerCase()}']!))
                                              .toStringAsFixed(1),
                                            style: TextStyle(color: Colors.white,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold),),


                                        ],),
                                      ),


                                      index + 1 == mybox!.get("foodQuantity").length ?

                                      Container(padding: EdgeInsets.symmetric(
                                          horizontal: 22.w),
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12), color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text("45".tr,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight: FontWeight
                                                          .bold),)
                                              ],),
                                            Row(mainAxisAlignment: MainAxisAlignment
                                                .spaceAround, children: [
                                              Text("41".tr, style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),),
                                              Text("42".tr, style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),),
                                              Text("43".tr, style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),),
                                              Text("44".tr, style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),),

                                            ]),

                                            Row(children: [
                                              Container(padding: EdgeInsets.only(
                                                  left: 25.w),
                                                  child: Text("${calofProtien
                                                      .round() + calofCarb
                                                      .round() + calofFat
                                                      .round()}",
                                                    style: TextStyle(color: Colors
                                                        .black,
                                                        fontSize: 11.sp,
                                                        fontWeight: FontWeight
                                                            .bold),)),
                                              Container(padding: EdgeInsets.only(
                                                  left: 60.w),
                                                  child: Text("${protienofProtien
                                                      .round() + protienofCarb
                                                      .round() + mybox!.get("protienofFat")
                                                      .round()}",
                                                    style: TextStyle(color: Colors
                                                        .black,
                                                        fontSize: 11.sp,
                                                        fontWeight: FontWeight
                                                            .bold),)),
                                              Container(padding: EdgeInsets.only(
                                                  left: 52.w),
                                                  child: Text("${mybox!.get("carbofProtien")
                                                      .round() + carbofCarb
                                                      .round() + mybox!.get("carbofFat")
                                                      .round()}",
                                                    style: TextStyle(color: Colors
                                                        .black,
                                                        fontSize: 11.sp,
                                                        fontWeight: FontWeight
                                                            .bold),)),
                                              Container(padding: EdgeInsets.only(
                                                  left: 44.w),
                                                  child: Text("${fatofProtien
                                                      .round() + fatofCarb
                                                      .round() + fatofFat
                                                      .round()}",
                                                    style: TextStyle(color: Colors
                                                        .black,
                                                        fontSize: 11.sp,
                                                        fontWeight: FontWeight
                                                            .bold),))

                                              ,
                                            ],),
                                          ],

                                        ),)
                                          : const Divider(
                                        color: Colors.grey,
                                        // Set the color of the line (default is Colors.grey)
                                        thickness: 1.0,
                                        // Set the thickness of the line (default is 0.5)
                                        height: 20, // Set the height of the line (default is 16)
                                      ),


                                    ],
                                  ),
                                );
                              },),
                          ),


                        ],),
                      )
                      ),

                    ],
                  ),
                ),


              ],


            ),
          ),
        ),
      ),
    );

  }}

var generated = mybox!.put('generated',false);

class Home2 extends StatefulWidget {
    Home2({Key? key}) : super(key: key);
  @override
  State<Home2> createState() => _Home2State();
}
 int lenth =0 ;

class _Home2State extends State<Home2> {
  HomeController homeController = HomeController();
  void initState() {
    super.initState();
    homeController.checkRecipeIngredients();
    lenth=homeController.recipeFilterd.length;
    generated;

  }

    bool hoverd=false;

  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(init: HomeController(),builder: (controller) =>
        Scaffold(appBar:CustomAppBar(),
          backgroundColor: Colors.black,
      body:  Container(padding: EdgeInsets.symmetric(horizontal: 11,vertical: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            mybox!.get("generated")==false?
          Text("You Can make a delicious healthy food ",style: TextStyle(color: Colors.white),):Text("You can choose recipes from below"),
          mybox!.get("generated")==false? SizedBox(height: 4.h,):SizedBox(),
          mybox!.get("generated")==false? Text("Just Press Generate to generate Possible recipes",style: TextStyle(color: Colors.white),):SizedBox(),
          mybox!.get("generated")==false?SizedBox(height: 30.h,):SizedBox(),
          mybox!.get("generated")==false? Center(
            child: CustomMaterialButton(onPressed: (){
              controller.checkRecipeIngredients();
              mybox!.put("recipeFilterd", controller.recipeFilterd);
              mybox!.put("generated", true);
              lenth=controller.recipeFilterd.length;
            }, buttonText: "Generate !"),
          ):SizedBox(),


          mybox!.get("generated")? ListView.builder(itemCount:  lenth ,shrinkWrap: true,itemBuilder: (context, index) {

            var ingredientsString = mybox!.get("recipeFilterd")[index].ingredients!.join(', ');
            return Container(padding: EdgeInsets.only(top: 8.h),
              child: Row(children: [CircleAvatar(radius: 30,child: Image.asset("${mybox!.get("recipeFilterd")[index].image}"),),
                SizedBox(width: 8.w,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("${mybox!.get("recipeFilterd")[index].recipeName}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),

                  Text("Ingredients :",style: TextStyle(color: Colors.white,fontSize: 12),),
                  Text("$ingredientsString",style: TextStyle(color: Colors.blueAccent,fontSize: 12),),
              ],),

              Row(children: [IconButton(onPressed: () {}, icon:Icon(CupertinoIcons.arrow_down_square,color: Colors.white,)),],)
              ]

                ,),
            );

            },):SizedBox(),


        ]),
      ),));
  }
}

class Home3 extends StatefulWidget {


  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  @override
  void initState() {
    super.initState();
      tz.initializeTimeZones();
      initializeNotifications();
  }

  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(init: HomeController(),builder: (controller) =>(
        Scaffold(backgroundColor: Colors.black,appBar:CustomAppBar(),
            body:Container(padding: EdgeInsets.symmetric(horizontal: 11,vertical: 30),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text("Here you should enter your weight daily",style: TextStyle(color: Colors.white),),
                SizedBox(height: 4.h,),
                Text("you can ask for daily alert by pressing below :",style: TextStyle(color: Colors.white),),
                SizedBox(height: 25,),
                Center(child: CustomMaterialButton(onPressed: (){selectTime(context);}, buttonText: "Daily Reminder"))

              ],),
            )
        )

    ));
  }
}
class Home4 extends StatefulWidget {
  const Home4({Key? key}) : super(key: key);

  @override
  State<Home4> createState() => _Home4State();
}

class _Home4State extends State<Home4> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(init: HomeController(),builder: (controller) =>(
        Scaffold(appBar:CustomAppBar(),backgroundColor: Colors.black,body: Center(child: MaterialButton(color: Colors.red,onPressed: ()async{

            await authService.hangleSignOut();
            myServices.sharedPreferences.remove("goHome");
            myServices.sharedPreferences.remove("user");
            Get.offAll(AuthPage());


         },child: Text("Sign Up"),),),))
    );
  }
}

// return Container(child: ListTile(subtitle: Text("$ingredientsString",style: TextStyle(color: Colors.white),),title:Text("${controller.recipeFilterd[index].recipeName}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),leading: CircleAvatar(radius: 30,child: Image.asset("${controller.recipeFilterd[index].image}"),),),);



//
//
// Container(
// padding: EdgeInsets.symmetric(horizontal: 22.w),
// child: Stack(alignment: Alignment.topCenter,
// children: [
//
//
//
// ListView.builder(itemCount: controller.recipeFilterd.length,itemBuilder: (context, index) {
// return InkWell( splashColor: Colors.black,
// onTap: () {
// if (controller.recipeFilterd[index].isSelected == true) {
// controller.recipeFilterd[index].isSelected = false;
// } else {
// controller.recipeFilterd[index].isSelected == true;
// controller.checkRecipeIngredients();
// }},
//
// child:
// Row(
// mainAxisAlignment: MainAxisAlignment.start, children: [
// Image(image: AssetImage(
// "${controller.recipeFilterd[index].image}"),
// width: 85.w),
// SizedBox(width: 10.w,),
//
// Column(mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Text(
// "${controller.recipeFilterd[index].recipSteps}",
// style: const TextStyle(color: Colors.white,
// fontWeight: FontWeight.bold),),
// SizedBox(height: 10.h,),
// Text(
// "${controller.recipeFilterd[index].ingredients} ",
// style: const TextStyle(color: Colors.white),),
//
// ],),
// ],),
// );}
//
// ),
//
//
//
//
// ],
//
//
// ),
// )