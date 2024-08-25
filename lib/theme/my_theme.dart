import 'package:flutter/material.dart';
import 'package:news_app/theme/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static final ThemeData light = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),),),),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(fontSize:24,fontWeight:FontWeight.w700,color:AppColor.whiteColor),
        titleMedium: GoogleFonts.exo(fontSize:22,fontWeight:FontWeight.w400,color:AppColor.whiteColor),
        titleSmall: GoogleFonts.exo(fontSize:14,fontWeight:FontWeight.w400,color:AppColor.whiteColor),
        bodyLarge:GoogleFonts.poppins(fontSize:24,fontWeight:FontWeight.w700,color:AppColor.blackColor) ,
        bodyMedium: GoogleFonts.poppins(fontSize:22,fontWeight:FontWeight.w700,color:AppColor.grayColor),
        bodySmall:  GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:AppColor.secondaryGrayColor),
        headlineMedium:  GoogleFonts.exo(fontSize:14,fontWeight:FontWeight.w400,color:AppColor.blackColor),
        headlineSmall: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w300,color:AppColor.secondaryGrayColor),
      )
  );

}
