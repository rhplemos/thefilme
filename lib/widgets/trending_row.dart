import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefilme/constants.dart';
import 'package:thefilme/details/DetailsScreen.dart';

class TrendingRow extends StatelessWidget {
  const TrendingRow({
    Key? key,
    required this.title,
    required this.snapshot,
  }) : super(key: key);

  final String title;
  final AsyncSnapshot snapshot;

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
            itemCount: snapshot.data!.length,
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 0.45,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        movie: snapshot.data[itemIndex],
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
