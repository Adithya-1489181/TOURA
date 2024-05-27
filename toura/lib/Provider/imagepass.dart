import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TouristPlace {
  final String name;
  final String imageUrl;

  TouristPlace({required this.name, required this.imageUrl});
}

final touristPlaceProvider =
    FutureProvider.autoDispose<List<TouristPlace>?>((ref) async {
  final response = await http.get(Uri.parse('')); // Replace with your API URL
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List;
    return data
        .map((place) => TouristPlace(
              name: place['name'],
              imageUrl: place['image_url'],
            ))
        .toList();
  } else {
    return null;
  }
});
