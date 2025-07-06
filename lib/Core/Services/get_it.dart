import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:space_app/Core/Services/api_service.dart';
import 'package:space_app/Core/Services/backend_service.dart';
import 'package:space_app/Features/News%20Screen/data/repo/news_repo.dart';
import 'package:space_app/Features/News%20Screen/data/repo/news_repo_impl.dart';
import 'package:space_app/Features/News%20Screen/presentation/cubit/news_cubit.dart';
import 'package:space_app/Features/Planet%20Description/data/repo/planet_repo.dart';
import 'package:space_app/Features/Planet%20Description/data/repo/planet_repo_impl.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20cubit/planet_cubit.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20video%20cubit/planet_video_cubit.dart';

final get_it = GetIt.instance;
void setupServiceLocator() {
  get_it.registerSingleton<BackendService>(ApiService(dio: Dio()));
  
  // Register planet repository
  get_it.registerSingleton<PlanetRepository>(
    PlanetRepositoryImpl(backendService: get_it<BackendService>())
  );
  
  // Register news repository
  get_it.registerSingleton<NewsRepository>(
    NewsRepositoryImpl(backendService: get_it<BackendService>())
  );
  
  // Register planet cubit
  get_it.registerFactory<PlanetCubit>(
    () => PlanetCubit(planetRepository: get_it<PlanetRepository>())
  );
  
  // Register planet video cubit
  get_it.registerFactory<PlanetVideoCubit>(
    () => PlanetVideoCubit(planetRepository: get_it<PlanetRepository>())
  );
  
  // Register news cubit
  get_it.registerFactory<NewsCubit>(
    () => NewsCubit(newsRepository: get_it<NewsRepository>())
  );
}
