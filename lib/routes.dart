import 'package:flutter_book_store/screens/create_book/index.dart';
import 'package:flutter_book_store/screens/home_page/home_page.dart';
import 'package:flutter_book_store/screens/login/index.dart';
import 'package:flutter_book_store/screens/sign_up/index.dart';
import 'package:flutter_book_store/screens/splash/index.dart';
import 'package:get/route_manager.dart';

routes() => [
  GetPage(name: "/", page: () => Splash()),
  GetPage(name: "/login", page: () => const LoginPage()),
  GetPage(name: "/sign_up", page: () => const SignUpPage()),
  GetPage(name: "/homepage", page: () => HomePage()),
  GetPage(name: "/create_book", page: () => CreateBook()),

];