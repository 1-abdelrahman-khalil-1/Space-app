class PlanetModel {
  String? englishName;
  double? semimajorAxis; // Changed from int? to double?
  double? density;
  double? gravity;
  double? meanRadius;
  double? sideralOrbit;
  double? sideralRotation;

  PlanetModel({
    this.englishName,
    this.semimajorAxis,
    this.density,
    this.gravity,
    this.meanRadius,
    this.sideralOrbit,
    this.sideralRotation,
  });

  factory PlanetModel.fromMap(Map<String, dynamic> data) => PlanetModel(
        englishName: data['englishName'] as String?,
        // Handle both int and double values for semimajorAxis
        semimajorAxis: data['semimajorAxis'] != null
            ? (data['semimajorAxis'] is int
                ? (data['semimajorAxis'] as int).toDouble()
                : (data['semimajorAxis'] as num).toDouble())
            : null,
        density: (data['density'] as num?)?.toDouble(),
        gravity: (data['gravity'] as num?)?.toDouble(),
        meanRadius: (data['meanRadius'] as num?)?.toDouble(),
        sideralOrbit: (data['sideralOrbit'] as num?)?.toDouble(),
        sideralRotation: (data['sideralRotation'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'englishName': englishName,
        'semimajorAxis': semimajorAxis,
        'density': density,
        'gravity': gravity,
        'meanRadius': meanRadius,
        'sideralOrbit': sideralOrbit,
        'sideralRotation': sideralRotation,
      };
}
