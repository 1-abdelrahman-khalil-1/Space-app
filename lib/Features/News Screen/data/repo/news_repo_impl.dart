import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:space_app/Core/Error/custom_exception.dart';
import 'package:space_app/Core/Services/backend_service.dart';
import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';
import 'package:space_app/Features/News%20Screen/data/repo/news_repo.dart';

class NewsRepositoryImpl implements NewsRepository {
  final BackendService _backendService;

  NewsRepositoryImpl({required BackendService backendService})
      : _backendService = backendService;

  @override
  Future<Either<String, List<NewsModel>>> getNasaNews() async {
    try {
      log('Requesting NASA news');
      final result = await _backendService.fetchNasaNews();
      
      final newsList = result.map((item) {
        return NewsModel.fromMap({
          'title': item['title'],
          'description': item['explanation'],
          'imageUrl': item['url'],
          'date': item['date'],
          'url': item['hdurl'] ?? item['url'],
        });
      }).toList();
      
      log('Successfully received NASA news');
      return Right(newsList);
    } on CustomException catch (e) {
      log('CustomException caught in repository: ${e.message}');
      return Left(e.message);
    } catch (e) {
      log('Unexpected error in getNasaNews: ${e.toString()}');
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }
}