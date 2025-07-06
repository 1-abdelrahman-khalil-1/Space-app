  import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';

List<NewsModel> filterNewsByCategory(List<NewsModel> allNews, String categoryId) {
    switch (categoryId) {
      case 'human_space':
        return allNews.where((news) => 
          news.title.toLowerCase().contains('astronaut') || 
          news.description.toLowerCase().contains('astronaut') ||
          news.title.toLowerCase().contains('crew') || 
          news.description.toLowerCase().contains('crew')
        ).toList();
      case 'solar_system':
        return allNews.where((news) => 
          news.title.toLowerCase().contains('planet') || 
          news.description.toLowerCase().contains('planet') ||
          news.title.toLowerCase().contains('mars') || 
          news.description.toLowerCase().contains('mars') ||
          news.title.toLowerCase().contains('jupiter') || 
          news.description.toLowerCase().contains('jupiter')
        ).toList();
      case 'universe':
        return allNews.where((news) => 
          news.title.toLowerCase().contains('galaxy') || 
          news.description.toLowerCase().contains('galaxy') ||
          news.title.toLowerCase().contains('star') || 
          news.description.toLowerCase().contains('star') ||
          news.title.toLowerCase().contains('cosmos') || 
          news.description.toLowerCase().contains('cosmos')
        ).toList();
      case 'earth':
        return allNews.where((news) => 
          news.title.toLowerCase().contains('earth') || 
          news.description.toLowerCase().contains('earth') ||
          news.title.toLowerCase().contains('climate') || 
          news.description.toLowerCase().contains('climate')
        ).toList();
      case 'technology':
        return allNews.where((news) => 
          news.title.toLowerCase().contains('tech') || 
          news.description.toLowerCase().contains('tech') ||
          news.title.toLowerCase().contains('rocket') || 
          news.description.toLowerCase().contains('rocket')
        ).toList();
      default:
        return allNews.take(5).toList();
    }
  }