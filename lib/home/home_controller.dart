import 'package:get/get.dart';
import 'package:thefilme/api/api.dart';
import 'package:thefilme/models/movie.dart';

class HomeController extends GetxController {
  final Api api;

  HomeController({required this.api});

  var trendingMovies = <Movie>[].obs;
  var topRatedMovies = <Movie>[].obs;
  var upcomingMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      trendingMovies.assignAll(await api.getTrendingMovies());
      topRatedMovies.assignAll(await api.getTopRatedMovies());
      upcomingMovies.assignAll(await api.getUpcomingMovies());
    } catch (e) {

    }
  }
}
