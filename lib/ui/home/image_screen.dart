import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hrsummit/data/model/iamge_respModel.dart';
import 'package:hrsummit/state/homeModel.dart';
import 'package:hrsummit/ui/widgets/homeWidgets.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/utils/header_widget.dart';
import 'package:hrsummit/utils/viewModel.dart';
import 'package:hrsummit/widgets/commonBG.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatefulWidget {
  static const String route = '/itemDetail';
  

  const ItemDetailPage({super.key});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  String title = "";
  @override
  void initState() {
    withViewModel<HomeModel>(context, (viewModel) async {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      log("args *** $args");
      viewModel.calltabImgApi(args?['sqNo'], args?['type']);
      title = args?['title'];
    });
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MyAppBackGroundVM<HomeModel>(
      child: Consumer<HomeModel>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Column(
              children: [
                HeaderWidget(),
                SizedBox(height: 5),
                CommonAppbar(title: title),
                Center(
                  child: provider.tabImgRespDto.length == 1
                      ? Image.network(
                          baseImg +
                              provider.tabImgRespDto.first.iMGURL.toString(),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text("Image failed to load"),
                            );
                          },
                        )
                      : CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2),
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 16 / 9,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          items: provider.tabImgRespDto.map((url) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                baseImg + url.iMGURL.toString(),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text("Image failed to load"),
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
//   final List<Item> items = [
//     Item(title: "Item 1", imageUrls: ["https://picsum.photos/200/300"]),
//     Item(title: "Item 2", imageUrls: [
//       "https://picsum.photos/250/300",
//       "https://picsum.photos/260/300",
//       "https://picsum.photos/270/300",
//     ]),
//   ];
//   class Item {
//   final String title;
//   final List<String> imageUrls;

//   Item({required this.title, required this.imageUrls});
// }
