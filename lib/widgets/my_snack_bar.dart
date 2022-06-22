import 'package:flutter/material.dart';

class MySnackBar {
  static SnackBar createSnackBar({
    required Color bgColor,
    required Color iconColor,
    required Color textColor,
    required String text,
    required IconData icon,
  }) {
    return SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      backgroundColor: bgColor,
      behavior: SnackBarBehavior.floating,
      content: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 0,
        ),
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        title: Text(
          text,
      
        ),
        leading: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
