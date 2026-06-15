import 'package:flutter/material.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle tBarlow(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.barlow(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle tDmSans(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.dmSans(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle tInter(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.inter(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle stBarlow(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.barlow(
    color: color ?? AppColor.sText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

TextStyle stDmSans(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.dmSans(
    color: color ?? AppColor.sText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

TextStyle stInter(BuildContext context, {double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
  return GoogleFonts.inter(
    color: color ?? AppColor.sText,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

TextStyle tabLabelTextStyle(BuildContext context) {
  return tDmSans(context, fontSize: context.sp(16), fontWeight: FontWeight.bold, color: AppColor.bText);
}

TextStyle tabUnLabelTextStyle(BuildContext context) {
  return stDmSans(context, fontSize: context.sp(15), color: AppColor.bsText);
}
