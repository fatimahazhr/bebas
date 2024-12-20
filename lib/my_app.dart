import 'package:flutter/material.dart';
import 'package:flutter_application_1/day5.dart';
import 'package:flutter_application_1/learn.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/maps_page.dart';
import 'package:flutter_application_1/notification_page.dart';
import 'package:flutter_application_1/user/ui/user_screen.dart';
import 'package:flutter_application_1/websocket_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_application_1/my_homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
            return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
          
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
            useMaterial3: true,
          ),
           home: WebsocketPage(),
          // initialRoute: '/',
          // routes: {
          //   '/':(context) => Learn(),
          //   //'Latihan': (context) => Latihan(title:'Latihan')
          // },
        );

      },

    );
    
  }
}