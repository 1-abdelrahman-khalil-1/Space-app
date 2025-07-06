import 'package:space_app/Features/Planet%20Description/data/models/planet_model/planet_model.dart';

abstract class PlanetCubitState {}

class PlanetInitial extends PlanetCubitState {}

class PlanetDetailsLoading extends PlanetCubitState {}

class PlanetDetailsLoaded extends PlanetCubitState {
  final PlanetModel planet;

  PlanetDetailsLoaded({required this.planet});
}

class PlanetError extends PlanetCubitState {
  final String errorMessage;

  PlanetError({required this.errorMessage});
}