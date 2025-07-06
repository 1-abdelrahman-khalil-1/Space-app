import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/Features/Planet%20Description/data/repo/planet_repo.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20video%20cubit/planet_video_cubit_state.dart';

class PlanetVideoCubit extends Cubit<PlanetVideoCubitState> {
  final PlanetRepository planetRepository;

  PlanetVideoCubit({required this.planetRepository}) : super(PlanetVideoInitial());

  Future<void> getPlanetVideo({required String planetName}) async {
    emit(PlanetVideoLoading());

    final result = await planetRepository.getPlanetVideo(planetName: planetName);

    result.fold(
      (error) => emit(PlanetVideoError(errorMessage: error)),
      (videoUrl) => emit(PlanetVideoLoaded(videoId: videoUrl)),
    );
  }
}