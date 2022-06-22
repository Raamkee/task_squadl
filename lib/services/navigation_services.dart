import 'package:flutter/material.dart';

class NavigationServices {
  static Future changeScreen(BuildContext context, Widget screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  static void replaceScreen(BuildContext context, Widget screen) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));

  static Future<dynamic> close(BuildContext context, dynamic data) async =>
      Navigator.pop(context, data);
}
