import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_book_store/colors/app_color.dart';
import 'package:flutter_book_store/widgets/custom_text.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controller.dart';


class LoginButton extends StatelessWidget {
  final LoginController controller = Get.find();

  LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          controller.login();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(5)
        ),
        child: const Center(
          child: CustomText(
            text: "Đăng nhập",
            color: AppColors.WHITE,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
