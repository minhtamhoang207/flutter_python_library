import 'package:dio/dio.dart';
import 'package:flutter_book_store/models/login_response_model.dart';
import 'package:get_storage/get_storage.dart';

class LoginService{
  GetStorage box = GetStorage();
  Future<void> login(String username, String password) async {
    try{
      Dio dio = new Dio();
      Response response = await dio.post('https://booklibaryhehe.tk/login', data: {
        "username": username,
        "password": password
      });
      final LoginResponse? user = LoginResponse.fromJson(response.data);
      box.write("access_token", user!.data!.accessToken).then((value){
        print(box.read("access_token"));
      });
    } catch (e){
      print(e.toString());
      throw e;
    }
  }
}