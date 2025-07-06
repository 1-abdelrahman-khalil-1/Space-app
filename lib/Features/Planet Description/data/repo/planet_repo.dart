import 'package:dartz/dartz.dart';
import 'package:space_app/Features/Planet%20Description/data/models/planet_model/planet_model.dart';

abstract class PlanetRepository {
  Future<Either<String, PlanetModel>> getPlanetDetails({required String planetName});
  Future<Either<String, String>> getPlanetVideo({required String planetName});
}