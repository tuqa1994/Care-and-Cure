import 'package:application_1/provider/UsersProvider.dart';
import 'package:application_1/provider/doctorsProvider.dart';
import 'package:application_1/screen/login.dart';
import 'package:application_1/screen/services.dart';
import 'package:flutter/material.dart';
import 'screen/landingPage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UsersDbProvider()),
          ChangeNotifierProvider(create: (context) => DoctorProvidor()),
        ],
        child: MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ],
              background: Container(color: Color(0xFFF5F5F5))),
          home: LandingPage(),
          routes: {
            'Login': (context) => LoginPage(),
            'services': (context) => Services(),
            //'Map':(context) => ,
          },
        ));
  }
}
