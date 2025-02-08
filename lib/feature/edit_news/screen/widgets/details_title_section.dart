import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTitleSection extends  StatelessWidget {
  dynamic title;
   DetailsTitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 2,
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
