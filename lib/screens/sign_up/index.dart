import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_store/colors/app_color.dart';
import 'package:flutter_book_store/screens/sign_up/widgets/sign_up_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Scaffold(body: Obx(() {
            return !controller.loading.value
                ? Stack(
                    children: [
                      Container(),
                      Container(
                        color: AppColors.PRIMARY_COLOR.withOpacity(0.8),
                        child: Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 300,
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Stack(
                                  children: [
                                    Container(),
                                    Container(
                                      color: AppColors.PRIMARY_COLOR
                                          .withOpacity(0.5),
                                    )
                                  ],
                                )),
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
                                          controller: _fullName,
                                          onChanged: (value) {
                                            controller.fullName.value = value;
                                          },
                                          decoration: InputDecoration(
                                              filled: true,
                                              hintStyle: TextStyle(
                                                color: AppColors.GRAY.withOpacity(0.9)
                                              ),
                                              fillColor: AppColors.GRAY.withOpacity(0.15),
                                              border: InputBorder.none,
                                              hintText: "Họ và tên của bạn ^^"),
                                        ),
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
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: AppColors.GRAY.withOpacity(0.9)
                                              ),
                                              filled: true,
                                              fillColor: AppColors.GRAY.withOpacity(0.15),
                                              border: InputBorder.none,
                                              hintText: "Nhập mật khẩu của bạn"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 15),
                                        child: TextFormField(
                                          obscureText: true,
                                          maxLines: 1,
                                          controller: _confirmPassword,
                                          onChanged: (value) {
                                            controller.confirmPassword.value = value;
                                          },
                                          decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                  onPressed: (){print("ok");},
                                                  icon: Icon(Icons.remove_red_eye, size: 15),
                                              ),
                                              hintStyle: TextStyle(
                                                  color: AppColors.GRAY.withOpacity(0.9)
                                              ),
                                              filled: true,
                                              fillColor: AppColors.GRAY.withOpacity(0.15),
                                              border: InputBorder.none,
                                              hintText: "Xác nhận mật khẩu"),
                                        ),
                                      ),
                                      SignUpButton(),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: 'Đã có tài khoản? ',
                                                  style: TextStyle(
                                                      color: AppColors.GRAY)),
                                              TextSpan(
                                                text: ' Đăng nhập',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.PRIMARY_COLOR),
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.offNamed("/login");
                                                  },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }));
        });
  }
}
