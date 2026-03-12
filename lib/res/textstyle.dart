import 'package:flutter/material.dart';
import 'package:goalscore/res/app_color.dart';
import 'package:goalscore/utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle tMontserrat(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.montserrat(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}

TextStyle tInter(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.inter(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(15),
    height: height,
  );
}


TextStyle stMontserrat(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.montserrat(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

TextStyle stInter(
  BuildContext context, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? height,
}) {
  return GoogleFonts.inter(
    color: color ?? AppColor.text,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? context.sp(14),
    height: height,
  );
}

