import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toura/Provider/imagepass.dart';

class CarouselSliderSuggetions extends ConsumerStatefulWidget {
  const CarouselSliderSuggetions({
    super.key,
  });

  @override
  ConsumerState<CarouselSliderSuggetions> createState() =>
      _CarouselSliderSuggetionsState();
}

class _CarouselSliderSuggetionsState
    extends ConsumerState<CarouselSliderSuggetions> {
  @override
  Widget build(BuildContext context) {
    var imgs = ref.watch(touristPlaceProvider);
    return CarouselSlider(
      items: imgs.map((img) {
        return Image.asset(img);
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
      ),
    );
  }
}
