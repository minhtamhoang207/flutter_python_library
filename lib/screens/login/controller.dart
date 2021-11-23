import 'package:flutter_book_store/api_services/login_service.dart';
import 'package:flutter_book_store/colors/app_color.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  LoginService loginService = LoginService();
  var count = 0.obs;
  increment() => count++;
  var fileName = "".obs;

  RxBool loading = false.obs;
  RxString username = "".obs;
  RxString password = "".obs;

  void login() async {
    loading.toggle();
    print(loading);
    try{
      await loginService.login(username.value, password.value);
      Get.offNamed("/homepage");
      // await Future.delayed(Duration(milliseconds: 5000));
      Get.snackbar("Success", "Dang nhap thanh cong", backgroundColor: AppColors.GRAY.withOpacity(0.8));
      loading.toggle();
      print(loading);
    } catch(e){
      Get.snackbar("Failed", e.toString());
    }
  }
}