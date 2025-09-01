import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Center(
        child: item.imageUrls.length == 1
            ? Image.network(
                item.imageUrls.first,
                fit: BoxFit.contain,
              )
            : CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: item.imageUrls.map((url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
  final List<Item> items = [
    Item(title: "Item 1", imageUrls: ["https://picsum.photos/200/300"]),
    Item(title: "Item 2", imageUrls: [
      "https://picsum.photos/250/300",
      "https://picsum.photos/260/300",
      "https://picsum.photos/270/300",
    ]),
  ];
  class Item {
  final String title;
  final List<String> imageUrls;

  Item({required this.title, required this.imageUrls});
}