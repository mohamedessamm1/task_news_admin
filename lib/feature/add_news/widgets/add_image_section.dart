import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/manager/home_manager_cubit.dart';

class AddImageSection extends  StatelessWidget {
  const AddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:
      MediaQuery.of(context).size.width >= 600 ? 700.w : 300.w,
      height:
      MediaQuery.of(context).size.width >= 600 ? 400.h : 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: HomeManagerCubit.get(context).bytesFromPicker == null
          ? Center(child: Image.asset('assets/images/no_image.png'))
          : ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: SizedBox.fromSize(
          size: Size.fromRadius(48.r), // Image radius
          child: Image.memory(
            HomeManagerCubit.get(context).bytesFromPicker!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
