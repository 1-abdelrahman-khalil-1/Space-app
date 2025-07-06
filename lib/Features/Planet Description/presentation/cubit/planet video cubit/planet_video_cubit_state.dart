abstract class PlanetVideoCubitState {}

class PlanetVideoInitial extends PlanetVideoCubitState {}

class PlanetVideoLoading extends PlanetVideoCubitState {}

class PlanetVideoLoaded extends PlanetVideoCubitState {
  final String videoId;

  PlanetVideoLoaded({required this.videoId});
}

class PlanetVideoError extends PlanetVideoCubitState {
  final String errorMessage;

  PlanetVideoError({required this.errorMessage});
}