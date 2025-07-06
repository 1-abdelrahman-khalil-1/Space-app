import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:space_app/Core/Error/custom_exception.dart';
import 'package:space_app/Core/Services/backend_service.dart';
import 'package:space_app/Features/Planet%20Description/data/models/planet_model/planet_model.dart';
import 'package:space_app/Features/Planet%20Description/data/repo/planet_repo.dart';

class PlanetRepositoryImpl implements PlanetRepository {
  final BackendService _backendService;

  PlanetRepositoryImpl({required BackendService backendService})
      : _backendService = backendService;

  @override
  Future<Either<String, PlanetModel>> getPlanetDetails({required String planetName}) async {
    try {
      log('Requesting planet details for: $planetName');
      final result = await _backendService.fetchPlanetData(planetName: planetName);
      return Right(PlanetModel.fromMap(result));
    } on CustomException catch (e) {
      log('CustomException caught in repository: ${e.message}');
      return Left(e.message);
    } catch (e) {
      log('Unexpected error in getPlanetDetails: ${e.toString()}');
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }
  
  @override
  Future<Either<String, String>> getPlanetVideo({required String planetName}) async {
    try {
      log('Requesting planet video for: $planetName');
      final result = await _backendService.fetchPlanetVideo(planetName: planetName);
      log('Successfully received video ID');
      return Right(result);
    } on CustomException catch (e) {
      log('CustomException caught in repository: ${e.message}');
      return Left(e.message);
    } catch (e) {
      log('Unexpected error in getPlanetVideo: ${e.toString()}');
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }
}