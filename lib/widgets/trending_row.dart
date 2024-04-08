import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefilme/constants.dart';
import 'package:thefilme/details/details_screen.dart';
import 'package:thefilme/home/home_controller.dart';
import 'package:thefilme/models/movie.dart';

class TrendingRow extends GetView<HomeController> {
  final String title;
  final RxList<Movie> movies;

  TrendingRow(this.movies, {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          if (movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Text(
              title,
              style: GoogleFonts.aBeeZee(fontSize: 25),
            );
          }
        }),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: Obx(() {
            if (movies.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return CarouselSlider.builder(
                itemCount: movies.length,
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
                      Get.to(() => DetailsScreen(
                        movie: movies[itemIndex],
                      ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 300,
                        width: 200,
                        child: Image.network(
                          '${Constants.imagePath}${movies[itemIndex].posterPath}',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ),
      ],
    );
  }
}
