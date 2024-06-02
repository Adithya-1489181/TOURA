import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TouristPlace {
//   final String name;
//   final String imageUrl;

//   TouristPlace({required this.name, required this.imageUrl});
// }

// final touristPlaceProvider =
//     FutureProvider.autoDispose<List<TouristPlace>?>((ref) async {
//   final response = await http.get(Uri.parse('')); // Replace with your API URL
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body) as List;
//     return data
//         .map((place) => TouristPlace(
//               name: place['name'],
//               imageUrl: place['image_url'],
//             ))
//         .toList();
//   } else {
//     return null;
//   }
// });

List imagesC = <String>[
  'assets/images/img1.jpeg',
  'assets/images/img2.jpeg',
  'assets/images/img3.jpeg',
  'assets/images/img4.jpeg',
];

final touristPlaceProvider = Provider((ref) {
  return imagesC;
});
