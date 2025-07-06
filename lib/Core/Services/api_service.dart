import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:space_app/Core/Error/custom_exception.dart';
import 'package:space_app/Core/Services/backend_service.dart';

class ApiService implements BackendService {
  final Dio dio;

  ApiService({required this.dio});
  @override
  Future<Map<String, dynamic>> fetchPlanetData(
      {required String planetName}) async {
    try {
      log("Fetching data for planet: $planetName");
      Response response = await dio.get(
          "https://api.le-systeme-solaire.net/rest/bodies?filter=englishName,eq,$planetName");

      if (response.statusCode == 200) {
        final bodies = response.data["bodies"] as List?;

        if (bodies == null || bodies.isEmpty) {
          log("No data found for planet: $planetName");
          throw CustomException(message: "No data found for planet: $planetName");
        }

        log("Successfully retrieved planet data for: $planetName");
        return response.data["bodies"][0];
      } else {
        log("Failed to load planet data: ${response.statusCode} - ${response.statusMessage}");
        throw CustomException(message: "Failed to load planet data: Status ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching planet data: $e");
      throw CustomException(message: "Error fetching planet data: $e");
    }
  }

  @override
  Future<String> fetchPlanetVideo({required String planetName}) async {
    final String youtubeBaseUrl =
        "https://www.googleapis.com/youtube/v3/search";
    try {
      // Get API key from .env file
      final String apiKey = dotenv.env['YOUTUBE_API_KEY'] ?? '';
      if (apiKey.isEmpty) {
        log("YouTube API key not found in .env file");
        throw CustomException(
            message: "YouTube API key not found in .env file");
      }

      log("Fetching video for planet: $planetName with API key available: ${apiKey.isNotEmpty}");
      final response = await dio.get(youtubeBaseUrl,
          queryParameters: {'q': '$planetName documentary 4k', 'key': apiKey, });

      if (response.statusCode == 200) {
        final items = response.data["items"] as List?;
        if (items == null || items.isEmpty) {
          log("No videos found for planet: $planetName");
          throw CustomException(message: "No videos found for this planet");
        }

        log("Successfully retrieved video ID for: $planetName");
        return response.data["items"][0]["id"]["videoId"];
      } else {
        log("Failed to load planet videos: ${response.statusCode} - ${response.statusMessage}");
        throw CustomException(message: "Failed to load planet videos: Status ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching planet videos: $e");
      throw CustomException(message: "Error fetching planet videos: $e");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchNasaNews() async {
    try {
      log("Fetching NASA news");
      // Get API key from .env file
      final String apiKey = dotenv.env['NASA_API_KEY'] ?? '';
      
      final response = await dio.get(
        "https://api.nasa.gov/planetary/apod",
        queryParameters: {
          'api_key': apiKey,
          'count': 20, 
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        log("Successfully retrieved NASA news data");
        return List<Map<String, dynamic>>.from(data);
      } else {
        log("Failed to load NASA news: ${response.statusCode} - ${response.statusMessage}");
        throw CustomException(message: "Failed to load NASA news: Status ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching NASA news: $e");
      throw CustomException(message: "Error fetching NASA news: $e");
    }
  }
}
