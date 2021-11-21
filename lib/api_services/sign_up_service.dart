import 'package:dio/dio.dart';

class SignUpService{
  Future<void> signUp(String fullName, String username, String password) async {
    try{
      Dio dio = new Dio();
      Response response = await dio.post('https://booklibaryhehe.tk/register', data: {
        "name": fullName,
        "username": username,
        "password": password
      });
      print(response);
    } catch (e){
      print(e.toString());
      throw e;
    }
  }

}