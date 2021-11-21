import 'package:flutter_book_store/api_services/sign_up_service.dart';
import 'package:flutter_book_store/colors/app_color.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  SignUpService signUpService = SignUpService();

  var loading = false.obs;
  RxString fullName = "".obs;
  RxString username = "".obs;
  RxString password = "".obs;
  RxString confirmPassword = "".obs;
  
  void signUp() async {
    loading.toggle();
    print(loading);
    try{
      await signUpService.signUp(fullName.value, username.value, password.value);
      // await Future.delayed(Duration(milliseconds: 5000));
      Get.snackbar("Success", "Dang ki thanh cong", backgroundColor: AppColors.PRIMARY_COLOR);
      loading.toggle();
      print(loading);
    } catch(e){
      Get.snackbar("Failed", e.toString());
    }
  }

}