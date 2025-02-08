import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsImageSection extends StatelessWidget {
  dynamic image;
   DetailsImageSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:
      MediaQuery.of(context).size.width >= 600 ? 700.w : 300.w,
      height:
      MediaQuery.of(context).size.width >= 600 ? 400.h : 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ]),
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
    );

  }
}
