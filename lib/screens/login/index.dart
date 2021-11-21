import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_store/colors/app_color.dart';
import 'package:flutter_book_store/screens/login/widgets/login_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller){
          return Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(

                    ),
                  ),
                  Container(
                    color: AppColors.PRIMARY_COLOR.withOpacity(0.8),
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height-300,
                        width: MediaQuery.of(context).size.width/2.2,
                        child: Row(
                          children: [
                            Expanded(
                                child: Stack(
                                  children: [
                                    Container(

                                    ),
                                    Container(
                                      color: AppColors.PRIMARY_COLOR.withOpacity(0.5),
                                    )
                                  ],
                                )
                            ),
                            Expanded(
                                child: Container(
                                  color: AppColors.WHITE,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        child: Lottie.network(
                                            'https://assets7.lottiefiles.com/packages/lf20_2scSKA.json'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 15),
                                        child: TextFormField(
                                          maxLines: 1,
                                          controller: _username,
                                          onChanged: (value) {
                                            controller.username.value = value;
                                          },
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: AppColors.GRAY.withOpacity(0.9)
                                              ),
                                              filled: true,
                                              fillColor: AppColors.GRAY.withOpacity(0.15),
                                              border: InputBorder.none,
                                              hintText: "Tên đăng nhập"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 15),
                                        child: TextFormField(
                                          obscureText: true,
                                          maxLines: 1,
                                          controller: _password,
                                          onChanged: (value) {
                                            controller.password.value = value;
                                          },
                                          onFieldSubmitted: (value){
                                            controller.login();
                                          },
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: AppColors.GRAY.withOpacity(0.9)
                                              ),
                                              filled: true,
                                              fillColor: AppColors.GRAY.withOpacity(0.15),
                                              border: InputBorder.none,
                                              hintText: "Mật khẩu"),
                                        ),
                                      ),
                                      LoginButton(),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(text: 'Chưa có tài khoản? ',
                                              style: TextStyle(
                                                color: AppColors.GRAY
                                              )
                                            ),
                                            TextSpan(
                                              text: ' Đăng kí',
                                              style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.PRIMARY_COLOR),
                                              recognizer: TapGestureRecognizer()..onTap = () {
                                                Get.toNamed("/sign_up");
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          );
        }
    );
  }
}
