import 'package:dio/dio.dart';
import 'package:flutter_book_store/models/book_infor_model.dart';
import 'package:flutter_book_store/utils/Singleton.dart';

class CreateBookService{

  Future<dynamic> createInformation({
    String? name,
    String? description,
    int? publishedYear,
    String? thumbUrl,
    List<Map<String, int>>? categories,
    List<Map<String, String>>? languageCodes,
    List<Map<String, int>>? publisherId,
    String? author
  }) async {
    try{
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = "Bearer ${Singleton.instance.accessToken}";
      Response response = await dio.post('https://booklibaryhehe.tk/books', data: {
        "name": name,
        "description": description,
        "pages" : 0,
        "published_year": publishedYear,
        "thumb_url": thumbUrl,
        "category_id": categories,
        "language_code": languageCodes,
        "publisher_id": publisherId,
        "author_id": author
      });
      print(response.data);
      return response;
    } catch (e){
      print(e.toString());
      throw e;
    }
  }

  Future<void> uploadBook({
    String? name,
    String? description,
    int? publishedYear,
    String? thumbUrl,
    List<Map<String, int>>? categories,
    List<Map<String, String>>? languageCodes,
    List<Map<String, int>>? publisherId,
    String? author,
    String? bookUrl,
    String? extension,
    int? size,
  }) async {
    try{
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = "Bearer ${Singleton.instance.accessToken}";
      BookInformationResponse bookInformationResponse = await createInformation(name: name, description: description, publishedYear: publishedYear,
          thumbUrl: thumbUrl, categories: categories, languageCodes: languageCodes, publisherId: publisherId, author: author);

      Response response = await dio.post('https://booklibaryhehe.tk/files', data: {
        "url": bookUrl,
        "extension": extension,
        "size": size,
        "book_id": bookInformationResponse.data!.book!.id
      });
      print(response.data);
    } catch (e){
      print(e.toString());
      throw e;
    }
  }
}