import 'package:flutter/material.dart';
import 'package:teamleance_technecal_test/utils/app.dart';
import 'package:teamleance_technecal_test/utils/color_const.dart';


getButtonTextStyle() {
  return TextStyle(color: ColorConst.whiteColor);
}

getTextStyleNormal({
  Color color = Colors.black,
  double fontSize= .019,
}) {
  return TextStyle(fontSize: MediaQuery.of(App.navigatorKey.currentContext!).size.height * fontSize, color: color, fontWeight: FontWeight.normal);
}
getTextStyleNormalW5({
  Color color = Colors.black,
  var fontSize =  0.019,
  bool showLineThrough=false
}) {
  return TextStyle(fontSize: MediaQuery.of(App.navigatorKey.currentContext!).size.height *fontSize, color: color, fontWeight: FontWeight.w500,
    decoration: showLineThrough?TextDecoration.lineThrough:TextDecoration.none,
  );
}

getTextStyleBold({
  Color color = Colors.black,
}) {
  return TextStyle(fontSize: MediaQuery.of(App.navigatorKey.currentContext!).size.height * .03, color: color, fontWeight: FontWeight.bold);
}
