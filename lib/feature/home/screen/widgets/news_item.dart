import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/size_helper.dart';
import '../../../edit_news/screen/edit_news_screen.dart';
import 'home_image_news.dart';
import 'home_title_details_news.dart';

class NewsItem extends  StatelessWidget {
 dynamic image;
 dynamic title;
 dynamic shortSummary;
 dynamic details;
 dynamic id;
 dynamic isActive;

   NewsItem({super.key ,required this.id  ,required this.isActive ,required this.image,required this.title,required this.shortSummary,required this.details});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(

          width: MediaQuery.of(context).size.width - 40.w,
          height: SizeHelper().setSize(
              context: context, mobileSize: 140.w, pcSize: 190.w),
          decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 2,
                blurRadius: 4,)
            ],
              color: Color(0xffF1F9FB),
              borderRadius: BorderRadius.circular(20.r)),
          child: Container(
            width: MediaQuery.of(context).size.width - 15.w,
            height: SizeHelper().setSize(
                context: context, mobileSize: 145.w, pcSize: 495.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeImageNews(image: image,),
                SizedBox(width: 5.w,),
                HomeTitleDetailsNews(
                  title: title,
                  shortSummary: shortSummary,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15.h,),
        Row(
          children: [
            isActive==true?
            Container(
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(20) ), child: Center(child: Text('نشط',style: TextStyle(color: Colors.white)))):
            Container(
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20) ), child: Center(child: Text('غير نشط',style: TextStyle(color: Colors.white)))),
SizedBox(width: 15.w,),
            Expanded(
              child: InkWell(
                onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(title: title, image: image, shortSummary: shortSummary, details: details, id: id, isActive: isActive,)));
                },
                child: Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20) ), child: Center(child: Text('تعديل',style: TextStyle(color: Colors.white)))),
              ),
            )
          ],
        )
      ],
    );
  }
}
