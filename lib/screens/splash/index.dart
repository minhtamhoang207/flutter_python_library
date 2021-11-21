import 'package:flutter/material.dart';
import 'package:flutter_book_store/screens/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(context) {
    final SplashController c = Get.put(SplashController());
    c.checkToken();
    return Scaffold(
      body: Container(
        child: Center(
          child: SizedBox(
            height: 300,
            child: Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_2scSKA.json'),
          ),
        )
      ),
    );
  }
}