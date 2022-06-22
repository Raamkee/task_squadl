import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/my_snack_bar.dart';
import 'login_provider.dart';

class AppProvider with ChangeNotifier {
  late LoginProvider loginProvider;

  late SharedPreferences prefs;

  initiateApp(context) async {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    prefs = await SharedPreferences.getInstance();

    loginProvider.loginCheck(context);

    notifyListeners();
  }

  Future<void> showSnackBar(
    BuildContext context, {
    required text,
    required icon,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      MySnackBar.createSnackBar(
        text: text,
        icon: icon,
        bgColor: Colors.blue,
        iconColor: Colors.white,
        textColor: Colors.white,
      ),
    );
  }

  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      return false;
    }
  }
}
