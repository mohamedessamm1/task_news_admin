import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/home/manager/home_manager_cubit.dart';

class AddSwitchSection extends StatelessWidget {
  const AddSwitchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return                 Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: HomeManagerCubit.get(context).isActive,
          onChanged: (value) {
            HomeManagerCubit.get(context).changeSwitch();
          },
          activeColor: Colors.green,
          inactiveThumbColor: Colors.red,
        ),
        SizedBox(
          width: 20.w,
        ),
        HomeManagerCubit.get(context).isActive
            ? Text(
          'الخبر نشط',
          style: TextStyle(
              color: Colors.green,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        )
            : Text(
          'الخبر غير نشط',
          style: TextStyle(
              color: Colors.red,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
