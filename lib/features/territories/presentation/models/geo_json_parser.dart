import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

typedef MarkerCreationCallback = Marker Function(
    LatLng point, Map<String, dynamic> properties);
typedef PolylineCreationCallback = Polyline Function(
    List<LatLng> points, Map<String, dynamic> properties);
typedef PolygonCreationCallback = Polygon Function(List<LatLng> points,
    List<List<LatLng>>? holePointsList, Map<String, dynamic> properties);

class GeoJsonParser {
  /// Class GeoJsonParser parses the geoJson.
  final List<Marker> markers = [];
  final List<Polyline> polylines = [];
  final List<Polygon> polygons = [];
  MarkerCreationCallback? markerCreationCallback;
  PolylineCreationCallback? polyLineCreationCallback;
  PolygonCreationCallback? polygonCreationCallback;
  Color defaultMarkerColor = Colors.red.withOpacity(0.8);
  Icon defaultMarkerIcon = const Icon(Icons.location_pin);
  void Function(Map<String, dynamic>)? onMarkerTapCallback;

  GeoJsonParser(
      {this.markerCreationCallback,
      this.polyLineCreationCallback,
      this.polygonCreationCallback});

  void parseGeoJsonAsString(String g) {
    return parseGeoJson(jsonDecode(g) as Map<String, dynamic>);
  }

  /// Marker setters
  set setDefaultMarkerColor(Color color) {
    defaultMarkerColor = color;
  }

  set setDefaultMarkerIcon(Icon icon) {
    defaultMarkerIcon = icon;
  }

  void setDefaultMarkerTapCallback(
      Function(Map<String, dynamic> f) onTapFunction) {
    onMarkerTapCallback = onTapFunction;
  }

  void parseGeoJson(Map<String, dynamic> g) {
    markerCreationCallback ??= createDefaultMarker;
    polyLineCreationCallback ??= createDefaultPolyline;
    polygonCreationCallback ??= createDefaultPolygon;
    for (Map f in (g['features'])) {
      String geometryType = f['geometry']['type'].toString();
      switch (geometryType) {
        case 'Point':
          {
            markers.add(
              markerCreationCallback!(
                  LatLng(f['geometry']['coordinates'][1] as double,
                      f['geometry']['coordinates'][0] as double),
                  f['properties'] as Map<String, dynamic>),
            );
          }
          break;
        case 'MultiPoint':
          {
            for (final point in f['geometry']['coordinates'] as List) {
              markers.add(
                markerCreationCallback!(
                    LatLng(point[1] as double, point[0] as double),
                    f['properties'] as Map<String, dynamic>),
              );
            }
          }
          break;
        case 'LineString':
          {
            final List<LatLng> lineString = [];
            for (final coords in f['geometry']['coordinates'] as List) {
              lineString.add(LatLng(coords[1] as double, coords[0] as double));
            }
            polylines.add(polyLineCreationCallback!(
                lineString, f['properties'] as Map<String, dynamic>));
          }
          break;
        case 'MultiLineString':
          {
            for (final line in f['geometry']['coordinates'] as List) {
              final List<LatLng> lineString = [];
              for (final coords in line as List) {
                lineString
                    .add(LatLng(coords[1] as double, coords[0] as double));
              }
              polylines.add(polyLineCreationCallback!(
                  lineString, f['properties'] as Map<String, dynamic>));
            }
          }
          break;
        case 'Polygon':
          {
            final List<LatLng> outerRing = [];
            final List<List<LatLng>> holeList = [];
            int pathIndex = 0;
            for (final path in f['geometry']['coordinates'] as List) {
              final List<LatLng> hole = [];
              for (final coords in path as List<dynamic>) {
                if (pathIndex == 0) {
                  // add to polygon's outer ring
                  outerRing
                      .add(LatLng(coords[1] as double, coords[0] as double));
                } else {
                  // add it to current hole
                  hole.add(LatLng(coords[1] as double, coords[0] as double));
                }
              }
              if (pathIndex > 0) {
                // add hole to the polygon's list of holes
                holeList.add(hole);
              }
              pathIndex++;
            }
            polygons.add(polygonCreationCallback!(
                outerRing, holeList, f['properties'] as Map<String, dynamic>));
          }
          break;
        case 'MultiPolygon':
          {
            for (final polygon in f['geometry']['coordinates'] as List) {
              final List<LatLng> outerRing = [];
              final List<List<LatLng>> holeList = [];
              int pathIndex = 0;
              for (final path in polygon as List) {
                List<LatLng> hole = [];
                for (final coords in path as List<dynamic>) {
                  if (pathIndex == 0) {
                    // add to polygon's outer ring
                    outerRing
                        .add(LatLng(coords[1] as double, coords[0] as double));
                  } else {
                    // add it to a hole
                    hole.add(LatLng(coords[1] as double, coords[0] as double));
                  }
                }
                if (pathIndex > 0) {
                  // add to polygon's list of holes
                  holeList.add(hole);
                }
                pathIndex++;
              }
              polygons.add(polygonCreationCallback!(outerRing, holeList,
                  f['properties'] as Map<String, dynamic>));
            }
          }
          break;
      }
    }
    return;
  }

  Widget defaultTappableMarker(Map<String, dynamic> properties,
      void Function(Map<String, dynamic>) onMarkerTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          onTap: () {
            onMarkerTap(properties);
          },
          child: Icon(Icons.location_pin, color: defaultMarkerColor)),
    );
  }

  Marker createDefaultMarker(LatLng point, Map<String, dynamic> properties) {
    return Marker(
        point: point,
        builder: (context) => defaultTappableMarker(properties, markerTapped));
  }

  Polyline createDefaultPolyline(
      List<LatLng> points, Map<String, dynamic> properties) {
    return Polyline(points: points, color: Colors.blue, strokeWidth: 3);
  }

  Polygon createDefaultPolygon(List<LatLng> outerRing,
      List<List<LatLng>>? holeList, Map<String, dynamic> properties) {
    return Polygon(
      points: outerRing,
      holePointsList: holeList,
      borderColor: Colors.red,
      color: Colors.red.withOpacity(0.1),
      isFilled: true,
      borderStrokeWidth: 1,
      //label: properties['obmocje'].toString(),
      labelStyle: const TextStyle(color: Colors.black),
    );
  }

  void markerTapped(Map<String, dynamic> map) {
    if (onMarkerTapCallback != null) {
      onMarkerTapCallback!(map);
    }
  }
}
