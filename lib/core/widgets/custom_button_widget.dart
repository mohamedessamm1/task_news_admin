import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton({
  required Function() onTap,
  required String text,
   Widget? iconBtton,
  Color buttonColor = Colors.teal,
  Color textColor = Colors.white,


}) {
  return SizedBox(
    width: 331.w,
    height: 49.h,
    child: Card(
      color: buttonColor,
      child: InkWell(
        onTap:  onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: textColor),
              ),
              SizedBox(width: 5.w,),
              iconBtton ?? SizedBox()
            ],
          ),
        ),
      ),
    ),
  );
}
