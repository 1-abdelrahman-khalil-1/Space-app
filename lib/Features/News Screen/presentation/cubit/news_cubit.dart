import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/Features/News%20Screen/data/repo/news_repo.dart';
import 'package:space_app/Features/News%20Screen/presentation/cubit/news_cubit_state.dart';

class NewsCubit extends Cubit<NewsCubitState> {
  final NewsRepository newsRepository;

  NewsCubit({required this.newsRepository}) : super(NewsInitial());

  Future<void> getNasaNews() async {
    emit(NewsLoading());

    final result = await newsRepository.getNasaNews();

    result.fold(
      (error) => emit(NewsError(errorMessage: error)),
      (news) => emit(NewsLoaded(news: news)),
    );
  }
}