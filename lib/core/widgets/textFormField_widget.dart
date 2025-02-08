import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textFormFieldWidget(
        {required context,
         controller,
        required hint,
          int ?maxlines,
          String ?initialValue,
        required icon}) =>
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(0, 3)) // changes position of shadow
        ]),
        width: MediaQuery.of(context).size.width - 100,
        child: TextFormField(
          initialValue:initialValue ,
          controller: controller,
          cursorColor: Colors.grey,
          maxLines: maxlines,
          decoration: InputDecoration(
            suffixIcon: Icon(
              icon,
              color: Colors.blue,
            ),
            fillColor: Colors.white,
            filled: true,
            label: Text(
              hint,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
            border: OutlineInputBorder(
              borderSide:  BorderSide.none,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ),
    );
