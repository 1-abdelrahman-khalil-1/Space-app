import 'package:dartz/dartz.dart';
import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';

abstract class NewsRepository {
  Future<Either<String, List<NewsModel>>> getNasaNews();
}