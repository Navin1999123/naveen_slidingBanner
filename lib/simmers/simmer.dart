import 'package:flutter/material.dart';
import 'package:sliding_banners/custom_widgets/simmers.dart';

class LoadingSimmers extends StatelessWidget {
  const LoadingSimmers({super.key});

  @override
  Widget build(BuildContext context) {
  return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: const[
                 Text(
                  'Banners',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: 20),
                ShimmerCarousel(height: 200),
                 SizedBox(height: 20),
                 Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: 20),
                ShimmerCarousel(height: 200), // Adjust the height as needed
                 SizedBox(height: 20),
                 Text(
                  'Trending News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: 20),
                ShimmerCarousel(height: 200),
                 SizedBox(height: 20),
                 Text(
                  'Breaking News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: 20),
                ShimmerCarousel(height: 200),
              ],
            );
         
  }

 
}