// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/auth_services.dart';
import 'data/data_source/api_source/crud.dart';
import 'data/data_source/static/apikey.dart';
import 'main.dart';


class CustomAppBar extends AppBar {
  CustomAppBar() : super(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: Container(
      padding:EdgeInsets.only(top: 10.h),
      child: Image(height: 100.h,
        image: AssetImage("assets/100.png",),
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}
