class GeoJsonGeometry {
  GeoJsonGeometry({required this.type, required this.coordinates});

  String type;
  List<List<List<double>>> coordinates;
}
