import 'package:flutter/material.dart';
import 'package:flutter_book_store/screens/create_book/create_book_controller.dart';
import 'package:flutter_book_store/widgets/custom_text.dart';
import 'package:get/get.dart';

class CreateBook extends StatefulWidget {
  const CreateBook({Key? key}) : super(key: key);

  @override
  _CreateBookState createState() => _CreateBookState();
}

class _CreateBookState extends State<CreateBook> {
  final String? bookUrl = Get.parameters['bookUrl'];
  final String? name = Get.parameters['name'];

  @override
  Widget build(BuildContext context) {
    final CreateBookController controller = Get.put(CreateBookController());
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: ()async{
            await controller.uploadBook(bookUrl, name);
          },
          child: CustomText(
            text: "Create book hehe",
          ),
        ),
      ),
    );
  }
}
