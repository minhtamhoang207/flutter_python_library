import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_store/colors/app_color.dart';
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
  bool drawerOpen = true;
  late DropzoneViewController _dropzoneViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      SizedBox(
        child: Drawer(
          child: Column(
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.menu_book_outlined,
                          size: 30, color: AppColors.PRIMARY_COLOR),
                      CustomText(
                        text: "  TOM'sBOOKSTO",
                        color: AppColors.PRIMARY_COLOR,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      GestureDetector(
                        child: Icon(Icons.menu,
                            size: 30, color: AppColors.PRIMARY_COLOR),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                onHover: (val) {
                  print(val);
                  print("I'm in");
                },
                onTap: () {
                  print("tapp");
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home_outlined,
                        color: AppColors.PRIMARY_COLOR, size: 20),
                    SizedBox(width: 10),
                    CustomText(
                      text: "Shop",
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 15, color: AppColors.PRIMARY_COLOR)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.person_add_alt_1_outlined,
                        color: AppColors.PRIMARY_COLOR, size: 20),
                    SizedBox(width: 10),
                    CustomText(
                      text: "Admin",
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 15, color: AppColors.PRIMARY_COLOR)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.person_outline_outlined,
                        color: AppColors.PRIMARY_COLOR, size: 20),
                    SizedBox(width: 10),
                    CustomText(
                      text: "User",
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 15, color: AppColors.PRIMARY_COLOR)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.search,
                        color: AppColors.PRIMARY_COLOR, size: 20),
                    SizedBox(width: 10),
                    CustomText(
                      text: "Type",
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 15, color: AppColors.PRIMARY_COLOR)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.local_fire_department,
                      color: AppColors.PRIMARY_COLOR, size: 20),
                  SizedBox(width: 10),
                  CustomText(
                    text: "Most popular",
                    color: AppColors.PRIMARY_COLOR,
                    fontSize: 16,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      size: 15, color: AppColors.PRIMARY_COLOR)
                ]),
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  CustomText(
                      text: "Shop",
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.PRIMARY_COLOR.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
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
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search something ...",
                              hintStyle: TextStyle(fontSize: 13),
                              border: InputBorder.none),
                        ),
                      )),
                  Spacer(),
                  Icon(Icons.notifications_none_outlined),
                  SizedBox(width: 10),
                  Icon(Icons.mail_outline),
                  SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        _showMaterialDialog(context);
                      },
                      icon: Icon(Icons.cloud_upload_outlined)),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/bujo-48243.appspot.com/o/task%2Fuser_11%2F1626867481553471?alt=media&token=2a561c13-0416-410f-bd65-d1cdba2f7a61",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Hoang Minh Tam", fontWeight: FontWeight.bold),
                      InkWell(
                          onTap: () async {
                            final box = GetStorage();
                            await box.erase();
                            Get.offAllNamed("/login");
                          },
                          child: CustomText(
                              text: "Premium", color: AppColors.PRIMARY_COLOR)),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
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
                                text: "Browse Books",
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
                                          text: "View More",
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
                                      html.window.open(
                                          'http://www.africau.edu/images/default/sample.pdf',
                                          '_blank');
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
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
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
                                                    Icon(Icons.favorite,
                                                        color: Colors.red),
                                                    SizedBox(width: 20),
                                                    Icon(Icons.remove_red_eye,
                                                        color: AppColors
                                                            .PRIMARY_COLOR)
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
              ),
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
