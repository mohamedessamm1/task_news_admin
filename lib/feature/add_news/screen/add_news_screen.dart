import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_dashboard/core/widgets/custom_button_widget.dart';
import 'package:news_dashboard/feature/add_news/widgets/add_image_section.dart';
import 'package:news_dashboard/feature/add_news/widgets/add_textfield_section.dart';
import 'package:news_dashboard/core/widgets/textFormField_widget.dart';
import 'package:news_dashboard/feature/home/manager/home_manager_cubit.dart';

import '../../../core/widgets/add_switch_section.dart';

class AddNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeManagerCubit, HomeManagerState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'إضافه خبر جديد',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                AddImageSection(),
                SizedBox(
                  height: 20.h,
                ),
                customButton(
                    onTap: () {
                      HomeManagerCubit.get(context).pickImage();
                    },
                    text: 'اختر صوره'),
                SizedBox(
                  height: 20.h,
                ),
                AddSwitchSection(),
                SizedBox(
                  height: 20.h,
                ),
                AddTextfieldSection(),
                customButton(
                  buttonColor:
                      HomeManagerCubit.get(context).bytesFromPicker == null
                          ? Colors.grey
                          : Colors.teal,
                  onTap: () {
                    HomeManagerCubit.get(context).bytesFromPicker == null
                        ? print('inActive')
                        : HomeManagerCubit.get(context).uploadDataBase(
                            context: context,
                          );
                  },
                  text: 'إضافه الخبر',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
