import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefilme/api/api.dart';
import 'package:thefilme/home/home_controller.dart';
import 'package:thefilme/widgets/movie_row.dart';
import 'package:thefilme/widgets/trending_row.dart';

class HomeScreen extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController(api: Api()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'The Movie',
          style: GoogleFonts.aBeeZee(fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              Obx(() {
                if (controller.trendingMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return TrendingRow(
                    title: "Mais populares",
                    movies: controller.trendingMovies,
                  );
                }
              }),
              Obx(() {
                if (controller.topRatedMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return MovieRow(
                    title: "Melhor avaliados",
                    movies: controller.topRatedMovies,
                  );
                }
              }),
              Obx(() {
                if (controller.upcomingMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return MovieRow(
                    title: "Lançamentos",
                    movies: controller.upcomingMovies,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
