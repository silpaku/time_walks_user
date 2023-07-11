import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  final List<Widget> _images = [
    Image.asset('assets/s1.jpeg'),
    Image.asset('assets/s2.jpeg'),
    Image.asset('assets/s3.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 700,
          
          child: CarouselSlider(
            options: CarouselOptions(
              height: 400,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 200),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _images,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images.map((image) {
            int index = _images.indexOf(image);
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

  CircleAvatarsWidget({required this.avatarImages,required this.avatarNames});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        avatarImages.length,
        (index) => Padding(
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
      
    );
  }
}

