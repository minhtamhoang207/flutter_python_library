import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_store/colors/app_color.dart';
import 'package:flutter_book_store/screens/home_page/home_controller.dart';
import 'package:flutter_book_store/widgets/custom_text.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import '../../colors/app_color.dart';
import '../../widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DropzoneViewController _dropzoneViewController;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
        body: Row(children: [
          ///drawer
      Obx(() =>
          AnimatedContainer(
            margin: EdgeInsets.only(top: 25, bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.PRIMARY_COLOR.withOpacity(0.3),
            ),
            width: homeController.openDrawer.value?250:80,
            duration: Duration(milliseconds: 0),
            child: Column(
              children: [
                SizedBox(height: 30),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(Icons.home,
                              size: 30, color: Colors.black38),
                        ),
                        homeController.openDrawer.value?
                        Row(
                          children: [
                            SizedBox(width: 10),
                            CustomText(text: "Trang chủ", fontWeight: FontWeight.w600, color: Colors.black38, fontSize: 16),
                          ],
                        ):SizedBox()
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(Icons.local_fire_department,
                              size: 30, color: Colors.black38),
                        ),
                        homeController.openDrawer.value?
                        Row(
                          children: [
                            SizedBox(width: 10),
                            CustomText(text: "Trending", fontWeight: FontWeight.w600, color: Colors.black38, fontSize: 16),
                          ],
                        ):SizedBox()
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(Icons.admin_panel_settings,
                              size: 30, color: Colors.black38),
                        ),
                        homeController.openDrawer.value?
                            Row(
                              children: [
                                SizedBox(width: 10),
                                CustomText(text: "Quản lý trang", fontWeight: FontWeight.w600, color: Colors.black38, fontSize: 16),
                              ],
                            ):SizedBox()
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(Icons.local_fire_department,
                              size: 30, color: Colors.black38),
                        ),
                        homeController.openDrawer.value?
                        Row(
                          children: [
                            SizedBox(width: 10),
                            CustomText(text: "Trending", fontWeight: FontWeight.w600, color: Colors.black38, fontSize: 16),
                          ],
                        ):SizedBox()
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: RotatedBox(
                            quarterTurns: homeController.openDrawer.value? 2:0,
                            child: Icon(
                                Icons.double_arrow_outlined,
                                size: 30, color: Colors.black38
                            ),
                          ),
                        ),
                        homeController.openDrawer.value?
                        Row(
                          children: [
                            SizedBox(width: 10),
                            CustomText(text: "Thu gọn", fontWeight: FontWeight.w600, color: Colors.black38, fontSize: 16),
                          ],
                        ):SizedBox()
                      ],
                    ),
                  ),
                  onTap: () {
                    homeController.openDrawer.toggle();
                  },
                ),
              ],
            ),
          )
      ),
      Expanded(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  CustomText(
                      text: "Logo logo",
                      color: Colors.black38,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width / 4,
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
                              suffixIcon: Icon(Icons.search),
                              hintText: "Nhập tên sách bạn muốn tìm ... ",
                              hintStyle: TextStyle(fontSize: 13),
                              border: InputBorder.none
                          ),
                        ),
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmarks_outlined, color: Colors.black38)),
                  SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        _showMaterialDialog(context);
                      },
                      icon: Icon(Icons.cloud_upload_outlined, color: Colors.black38)),
                  SizedBox(width: 18),
                  CustomText(
                      text: "Hoang Minh Tam", fontWeight: FontWeight.bold, fontSize: 18),
                  SizedBox(width: 10),
                  InkWell(
                      onTap: () async {
                        final box = GetStorage();
                        await box.erase();
                        Get.offAllNamed("/login");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                            color: AppColors.PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: CustomText(
                            text: "Admin", color: AppColors.WHITE),
                      )
                  ),
                ],
              ),
            ),
            Divider(),
            Obx(() =>
              !homeController.showBookDetails.value?
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.lightBlue
                            ),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Day la ten cua quyen sach ne",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: "mo ta quyen sach",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                text: "20/11/2021",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ):
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 4,
                            aspectRatio: 0.5,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                            disableCenter: true),
                        items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://firebasestorage.googleapis.com/v0/b/bujo-48243.appspot.com/o/task%2Fuser_11%2F1626867481553471?alt=media&token=2a561c13-0416-410f-bd65-d1cdba2f7a61"),
                                        fit: BoxFit.cover)),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Mới nhất",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.PRIMARY_COLOR,
                                    ),
                                    onPressed: () {},
                                    child: Center(
                                        child: CustomText(
                                            text: "Xem thêm",
                                            color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Container(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: 20,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 35,
                                    mainAxisSpacing: 2.0,
                                    childAspectRatio: 1.2),
                                itemBuilder: (BuildContext context, int index) {
                                  return Material(
                                    child: InkWell(
                                      onHover: (value) {},
                                      onTap: () {

                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "https://thumbor.4gamers.com.tw/s0Xx74_2ReUkxHSQsKNyJGO7tew=/800x0/filters:extract_cover():no_upscale():quality(80):format(jpeg):background_color(FFFFFF)/https%3A%2F%2Fimg.4gamers.com.tw%2Fckfinder-vn%2Fimage2%2Fauto%2F2021-11%2FUntitled%20%2876%29-211104-225420.png%3FversionId%3DOc3c3BmN9ufshbwZ_7RxAJCGzMyXmTwc"),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        text:
                                                        "Song nhu nhung doa hoa",
                                                        maxLines: 3,
                                                        fontSize: 19,
                                                        fontWeight: FontWeight.bold,
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CustomText(
                                                        text: "Day la ten tac gia",
                                                        fontSize: 15,
                                                      ),
                                                      SizedBox(height: 30),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          IconButton(
                                                            onPressed: (){},
                                                            icon: Icon(Icons.favorite,
                                                                color: index%2==0?Colors.red:Colors.black38),
                                                          ),
                                                          SizedBox(width: 20),
                                                          IconButton(
                                                            onPressed: (){
                                                              html.window.open(
                                                                  'http://www.africau.edu/images/default/sample.pdf',
                                                                  '_blank');
                                                            },
                                                            icon: Icon(Icons.remove_red_eye_outlined, color: AppColors.PRIMARY_COLOR),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      )
    ]));
  }

  void _showMaterialDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 0),
      pageBuilder: (_, __, ___) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 100, horizontal: 500),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Material(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomText(
                          text: "Tải tệp lên",
                          color: AppColors.PRIMARY_COLOR,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                          onTap: () {
                            // controller.fileName("");
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel_outlined)),
                    )
                  ],
                ),
                Divider(),
                Expanded(
                  child: Stack(
                    children: [
                      DropzoneView(
                          onCreated: (controller) => this._dropzoneViewController = controller,
                          onDrop: acceptFile
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Center(
                                  child: Icon(Icons.file_upload, size: 35),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                                onPressed: ()async{
                                  final event = await _dropzoneViewController.pickFiles();
                                  if(event.isEmpty) return;
                                  acceptFile(event.first);
                                },
                                child: CustomText(
                                  text: "Choose file",
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    Uint8List data = await _dropzoneViewController.getFileData(event);
    await uploadData(name, data);
  }
  Future<void> uploadData(String name, Uint8List data) async {

    firebase_storage.Reference ref =
    firebase_storage.FirebaseStorage.instance.ref('uploads/$name');
    try {
      await ref.putData(data, firebase_storage.SettableMetadata(contentType: 'application/pdf'));
      String url = (await ref.getDownloadURL()).toString();
      Get.toNamed('/create_book?bookUrl=$url&name=$name');
    }  catch (e) {
      print(e);
    }
  }
}
