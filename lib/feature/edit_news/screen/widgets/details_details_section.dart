import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsDetailsSection extends  StatelessWidget {
  dynamic details;
   DetailsDetailsSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Text(
        details,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14.sp),
      ),
    );
  }
}
