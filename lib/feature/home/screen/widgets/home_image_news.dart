import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/size_helper.dart';

class HomeImageNews extends  StatelessWidget {

  dynamic image;
   HomeImageNews({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: SizeHelper().setSize(
            context: context, mobileSize: 140.w, pcSize: 190.w),
        width: SizeHelper().setSize(
            context: context,
            mobileSize: 80.w,
            pcSize: 110.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: SizedBox.fromSize(
            size: Size.fromRadius(48.r), // Image radius
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
