import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<Widget> images;

  CarouselSliderWidget({required this.images});

  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 700,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 300,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 180),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.images, // Use the images from the widget parameter
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.map((image) {
            int index = widget.images.indexOf(image);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.black : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}



class CircleAvatarsWidget extends StatelessWidget {
  final List<String> avatarImages;
  final List<String> avatarNames;
  final Function(int) onTap;

  CircleAvatarsWidget({
    required this.avatarImages,
    required this.avatarNames,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        avatarImages.length,
        (index) => GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              children: [
                Text(avatarNames[index]),
                const SizedBox(height: 8),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(avatarImages[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

