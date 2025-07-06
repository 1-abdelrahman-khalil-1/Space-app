abstract class BackendService {
  Future<Map<String, dynamic>> fetchPlanetData({required String planetName});
  Future<String> fetchPlanetVideo({required String planetName});
  Future<List<Map<String, dynamic>>> fetchNasaNews();
}
