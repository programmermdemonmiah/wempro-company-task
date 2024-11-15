import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showErrorToast(BuildContext context, String title, String message) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(Icons.error, color: Colors.red[500]),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.red[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white.withOpacity(0.9),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
    duration: const Duration(milliseconds: 3000),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 10,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showTost(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black12,
      textColor: Colors.black54,
      fontSize: 15.sp);
}
