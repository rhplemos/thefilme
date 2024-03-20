import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingRow extends StatelessWidget {
  const TrendingRow({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.aBeeZee(fontSize: 25),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 10,
            options: CarouselOptions(
                height: 300,
                autoPlay: true,
                viewportFraction: 0.45,
                enlargeCenterPage: true,
                pageSnapping: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1)),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 300,
                  width: 200,
                  color: Colors.teal,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
