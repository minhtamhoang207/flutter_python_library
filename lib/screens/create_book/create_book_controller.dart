import 'package:flutter_book_store/api_services/create_book_service.dart';
import 'package:get/get.dart';

class CreateBookController extends GetxController{
  CreateBookService _createBookService = CreateBookService();

  uploadBook(String? bookUrl, String? name)async{
    try{
      print(bookUrl);
      print(name);
      await _createBookService.uploadBook(
          name: "Day la sach se gay",
          description: "Rat la hay suu tam cac cau chuyen se gay",
          publishedYear: 2021,
          thumbUrl: "https://i1.sndcdn.com/artworks-HZh1PLAjzR9wIdbq-65QFIQ-t500x500.jpg",
          categories: [
            {"id": 1},
          ],
          languageCodes:[],
          publisherId: [
            {"id": 1}
          ],
          author: "Le Bao khong Binh ",
          bookUrl: bookUrl,
          size: 0,
          extension: "PDF"
      );
    } catch(e){
      print(e);
    }
  }
}