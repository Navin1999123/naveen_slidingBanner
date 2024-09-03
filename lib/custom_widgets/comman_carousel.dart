

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sliding_banners/custom_widgets/simmers.dart';

class CustomCarousel extends StatelessWidget {
  final List<CarouselItem>? items; 
  final double height;
  final void Function(CarouselItem item)? onTap; 

  const CustomCarousel({
    Key? key,
    this.items,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items == null || items!.isEmpty) {
      return ShimmerCarousel(height: height);
    } else {
      return CarouselSlider(
        options: CarouselOptions(
          height: height,
          autoPlay: true,
          viewportFraction: 1.0,
          enlargeCenterPage: true,
        ),
        items: items!.map((item) {
          return GestureDetector(
            onTap: () => onTap?.call(item),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.coverImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(10),
                child: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    }
  }
}

class CarouselItem {
  final String title;
  final String coverImage;
  final String summary;

  CarouselItem({
    required this.title,
    required this.coverImage,
    required this.summary,
  });
}
