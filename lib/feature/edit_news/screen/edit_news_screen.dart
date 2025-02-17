import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_dashboard/core/widgets/textFormField_widget.dart';

import 'package:news_dashboard/feature/edit_news/screen/widgets/details_image_section.dart';
import 'package:news_dashboard/feature/home/manager/home_manager_cubit.dart';

import '../../../core/widgets/add_switch_section.dart';
import '../../../core/widgets/custom_button_widget.dart';

class DetailsScreen extends StatelessWidget {
  dynamic title;
  dynamic image;
  dynamic shortSummary;
  dynamic details;
  dynamic isActive;
  dynamic id;
  DetailsScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.shortSummary,
      required this.id,
      required this.isActive,
      required this.details});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeManagerCubit, HomeManagerState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.teal.shade700,
              title: Text(
                "تفاصيل الخبر",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      HomeManagerCubit.get(context).editNewsbytesFromPicker ==
                              null
                          ? DetailsImageSection(image: image)
                          : Image.memory(HomeManagerCubit.get(context)
                              .editNewsbytesFromPicker!),
                      customButton(
                          onTap: () {
                            HomeManagerCubit.get(context).editNewspickImage();
                          },
                          text: 'اختر صوره'),
                      customButton(
                          onTap: () async{
                            if(HomeManagerCubit.get(context).editNewsbytesFromPicker == null) {
                              print('');
                            }{
                            await  HomeManagerCubit.get(context)
                                  .editNewsuploadImageBytes(
                                  HomeManagerCubit.get(context)
                                      .editNewsbytesFromPicker!);
                            await  HomeManagerCubit.get(context).updateImageNews(context: context, id: id);
                            }

                          },
                          text: 'تحديث الصوره',
                          buttonColor: HomeManagerCubit.get(context)
                                      .editNewsbytesFromPicker ==
                                  null
                              ? Colors.grey
                              : Colors.teal),
                      HomeManagerCubit.get(context).editNewsbytesFromPicker ==
                          null ? Text('يرجي اختيار صوره للتحديث',style: TextStyle( color: Colors.red,fontSize: 12.sp ),) : Text(''),
                      SizedBox(
                        height: 15.h,
                      ),
                      Divider(),
                      AddSwitchSection(),
                      Text(
                        'العنوان',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                        '*  ${title}  *',
                        style: TextStyle(fontSize: 12.sp,color: Colors.teal),
                      ),
                      SizedBox(height: 5.h,),
                      textFormFieldWidget(
                          context: context,
                          controller: HomeManagerCubit.get(context).title,
                          hint: 'العنوان',
                          icon: Icons.edit),
                      Text(
                        'التفاصيل',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                        '*  ${details}   *',
                        style: TextStyle(fontSize: 12.sp,color: Colors.teal),
                      ),
                      SizedBox(height: 5.h,),
                      textFormFieldWidget(
                          context: context,
                          controller: HomeManagerCubit.get(context).details,
                          hint: 'التفاصيل',
                          icon: Icons.edit),
                      Text(
                        'نص قصير عن الخبر',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(height: 5.h,),

                      Text(
                        '*  ${shortSummary}  *',
                        style: TextStyle(fontSize: 12.sp,color: Colors.teal),
                      ),
                      SizedBox(height: 5.h,),
                      textFormFieldWidget(
                          context: context,
                          controller: HomeManagerCubit.get(context).shortSummary,
                          hint: 'نص قصير عن الخبر',
                          icon: Icons.edit),
                      SizedBox(
                        height: 15.h,
                      ),
                      customButton(
                          onTap: () {
                            HomeManagerCubit.get(context).updateData(
                                context: context,
                                oldShortSummary:shortSummary,
                                oldTitle: title.toString(),
                                oldDetails: details,

                                id: id);
                          },
                          text: 'حفظ التغييرات'),
                      SizedBox(height: 10.h,),
                      customButton(
                        buttonColor: Colors.red,
                          onTap: () {
                            HomeManagerCubit.get(context).deleteNews(
                                context: context,
                                id: id);
                          },
                          text: 'حذف الخبر'),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
