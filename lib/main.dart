import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_repository/core/dependency/dependency.dart';
import 'package:provider/provider.dart';
import 'core/navigation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: provider,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Gilroy",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}