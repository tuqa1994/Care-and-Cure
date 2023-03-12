import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../provider/UsersProvider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void initState() {
    context.read<UsersDbProvider>().insertUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            fit: BoxFit.fill,
            opacity: 150,
            image: NetworkImage(
                "https://st2.depositphotos.com/1177973/11183/i/950/depositphotos_111835904-stock-photo-doctor-holding-stethoscope.jpg")),
      ),
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // 1 -text
            Container(
              height: 100,
              width: 250,
              child: Text(
                "Care And Cure Is Our Goals",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 35,
                    fontFamily: 'Custom Fonts'),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('Login');
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    // fontSize: 20,
                    fontFamily: 'Custom Fonts'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                elevation: 20,
                shadowColor: Colors.blue,
                textStyle: TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
