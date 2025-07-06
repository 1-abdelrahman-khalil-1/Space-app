import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_card.dart';

class NewsCarousel extends StatelessWidget {
  final List<NewsModel> featuredNews;
  
  const NewsCarousel({
    super.key, 
    required this.featuredNews,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Featured Today",
            style: Apptextstyles.bold20.copyWith(color: Colors.white),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 300.h,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
          ),
          items: featuredNews.map((news) {
            return Builder(
              builder: (BuildContext context) {
                return NewsCard(
                  news: news,
                  isFeatured: true,
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}