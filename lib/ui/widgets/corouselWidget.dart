import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DynamicCarousel extends StatefulWidget {
  const DynamicCarousel({super.key});

  @override
  State<DynamicCarousel> createState() => _DynamicCarouselState();
}

class _DynamicCarouselState extends State<DynamicCarousel> {
   
  
  final List<String> imageList = [
    "assets/images/carousal1.png",
    "assets/images/carousal1.png",
    "assets/images/carousal1.png",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
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
          items: imageList.map((item) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
        ),

        // Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => {}, // if you want manual jump
              child: Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? Colors.orange
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
