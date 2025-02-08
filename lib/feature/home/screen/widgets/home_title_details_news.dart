import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTitleDetailsNews extends  StatelessWidget {
  dynamic title;
  dynamic shortSummary;

  HomeTitleDetailsNews({super.key, this.title, this.shortSummary});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h,),
        Container(
          width: MediaQuery.of(context).size.width <= 400 ? 200.w : MediaQuery.of(context).size.width - 250.w,

          child: Text(
            title,
            style: TextStyle(
              overflow:  TextOverflow.ellipsis,
                fontSize: MediaQuery.of(context).size.width <= 600 ? 13.sp : 17.sp, color: Colors.teal.shade800,fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10.h,),

        SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width <= 400 ? 200.w : MediaQuery.of(context).size.width - 250.w,
          child: Text(
            maxLines: 3,
            overflow:  TextOverflow.ellipsis,
            shortSummary,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width <= 600 ? 12.sp : 16.sp, color: Colors.black,fontWeight: FontWeight.w400),
          ),
        ),
      ],
    )
    ;
  }
}
