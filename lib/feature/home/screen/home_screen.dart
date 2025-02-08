import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_dashboard/feature/add_news/screen/add_news_screen.dart';
import 'package:news_dashboard/feature/home/screen/widgets/news_list.dart';

import '../manager/home_manager_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeManagerCubit, HomeManagerState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title: Text(
            'News',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: ConditionalBuilder(
                condition: state is! GetDataFromDataBaseLoadingState,
                builder: (context) => SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddNewsScreen(),
                              ));
                        },
                        child: Container(
                            width: 250.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text('إضافه خبر ',
                                    style: TextStyle(color: Colors.white)))),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(child: NewsList())
                    ],
                  ),
                ),
                fallback: (context) => Center(child: CircularProgressIndicator(),),)),
      );
    });
  }
}
