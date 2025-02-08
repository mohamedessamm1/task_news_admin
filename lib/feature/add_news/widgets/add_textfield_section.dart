import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_dashboard/core/widgets/textFormField_widget.dart';

import '../../home/manager/home_manager_cubit.dart';

class AddTextfieldSection extends  StatelessWidget {
  const AddTextfieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textFormFieldWidget(
            context: context,
            controller: HomeManagerCubit.get(context).title,
            hint: 'عنوان الخبر',
            icon: Icons.newspaper),
        SizedBox(
          height: 20.h,
        ),
        textFormFieldWidget(
            context: context,
            controller: HomeManagerCubit.get(context).details,
            hint: 'تفاصيل الخبر',
            icon: Icons.newspaper),
        SizedBox(
          height: 20.h,
        ),
        textFormFieldWidget(
            context: context,
            controller: HomeManagerCubit.get(context).shortSummary,
            hint: 'نص قصير عن الخبر',
            icon: Icons.newspaper),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
