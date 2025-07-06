import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';

abstract class NewsCubitState {}

class NewsInitial extends NewsCubitState {}

class NewsLoading extends NewsCubitState {}

class NewsLoaded extends NewsCubitState {
  final List<NewsModel> news;

  NewsLoaded({required this.news});
}

class NewsError extends NewsCubitState {
  final String errorMessage;

  NewsError({required this.errorMessage});
}