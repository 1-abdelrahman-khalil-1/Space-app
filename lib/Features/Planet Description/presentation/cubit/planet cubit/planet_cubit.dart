import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/Features/Planet%20Description/data/repo/planet_repo.dart';
import 'package:space_app/Features/Planet%20Description/presentation/cubit/planet%20cubit/planet_cubit_state.dart';

class PlanetCubit extends Cubit<PlanetCubitState> {
  final PlanetRepository planetRepository;

  PlanetCubit({required this.planetRepository}) : super(PlanetInitial());

  Future<void> getPlanetDetails({required String planetName}) async {
    emit(PlanetDetailsLoading());

    final result =
        await planetRepository.getPlanetDetails(planetName: planetName);

    result.fold(
      (error) => emit(PlanetError(errorMessage: error)),
      (planet) => emit(PlanetDetailsLoaded(planet: planet)),
    );
  }
}
