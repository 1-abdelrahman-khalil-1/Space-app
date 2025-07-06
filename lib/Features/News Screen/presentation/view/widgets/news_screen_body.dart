import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_app/Core/helper%20function/filter_news_by_category.dart';
import 'package:space_app/Core/utils/appimages.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_carousel.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_list.dart';

class NewsScreenBody extends StatelessWidget {
  const NewsScreenBody(
      {super.key, required this.featuredNews, required this.allNews});
  final List<NewsModel> featuredNews;
  final List<NewsModel> allNews;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
       SliverToBoxAdapter(child: Row(
        children: [
          SvgPicture.asset(AppImages.assetsImagesLogo , height: 15.w,),
          Text(" NEWs" , style: Apptextstyles.bold18,),
        ],
       ),) ,
      SliverToBoxAdapter(child: SizedBox(height: 16.h)),

      // Featured carousel
      SliverToBoxAdapter(
      child: NewsCarousel(
      featuredNews: featuredNews,
      ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 24.h)),

      // Human Space section
      if (filterNewsByCategory(allNews, 'human_space').isNotEmpty)
      SliverToBoxAdapter(
      child: NewsList(
        news: filterNewsByCategory(allNews, 'human_space'),
        title: 'Human Space',
      ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 24.h)),

      // Earth section
      if (filterNewsByCategory(allNews, 'earth').isNotEmpty)
      SliverToBoxAdapter(
      child: NewsList(
        news: filterNewsByCategory(allNews, 'earth'),
        title: 'Earth',
      ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      
      // Universe section
      if (filterNewsByCategory(allNews, 'universe').isNotEmpty)
      SliverToBoxAdapter(
      child: NewsList(
        news: filterNewsByCategory(allNews, 'universe'),
        title: 'Universe',
      ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      
      // Solar System section
      if (filterNewsByCategory(allNews, 'solar_system').isNotEmpty)
      SliverToBoxAdapter(
      child: NewsList(
        news: filterNewsByCategory(allNews, 'solar_system'),
        title: 'Solar System',
      ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 24.h)),

      // Technology section
      if (filterNewsByCategory(allNews, 'technology').isNotEmpty)
      SliverToBoxAdapter(
      child: NewsList(
        news: filterNewsByCategory(allNews, 'technology'),
        title: 'Technology',
      ),
      ),
      ],
    );
  }
}
