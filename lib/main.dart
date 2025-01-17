import 'package:flutter/material.dart';
import 'package:sumit_portfolio/presentation/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      builder: (_,child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
           textScaleFactor: 1,
          ),
          child: MaterialApp(
            title: 'Sumit Kushwaha',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomePage(), ),
        );
      },
    );
  }
}
