import 'package:flutter_book_store/utils/Singleton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{


  checkToken()async{
    GetStorage box = GetStorage();
    var token = await box.read("access_token");
    print(token);
    if(token != null){
      Singleton.instance.accessToken = token;
      gotoHome();
    } else{
      gotoLogin();
    }
  }


  gotoHome()async{
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed("/homepage");
  }

  gotoLogin()async{
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed("/homepage");
  }
}