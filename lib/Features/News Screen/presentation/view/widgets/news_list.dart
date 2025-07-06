import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_card.dart';

class NewsList extends StatelessWidget {
  final List<NewsModel> news;
  final String title;
  
  const NewsList({
    super.key, 
    required this.news,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: Apptextstyles.bold18.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 380.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: news.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 280.h,
                child: NewsCard(
                  news: news[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}