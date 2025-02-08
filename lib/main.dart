import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/home/manager/home_manager_cubit.dart';
import 'feature/home/screen/home_screen.dart';

void main() async{
  await Supabase.initialize(
    url: 'https://xrtdolatlwqyrxvpomzv.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhydGRvbGF0bHdxeXJ4dnBvbXp2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg4MDI4MjcsImV4cCI6MjA1NDM3ODgyN30.sR5FTNZT57aV40wHElhWqMBLDv_yc8SnFCS6VTHw64g',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeManagerCubit()..getDataFromDatabase(),
            ),
          ],
          child: MaterialApp(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),

            debugShowCheckedModeBanner: false,
            title: 'News_dashboard',
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
