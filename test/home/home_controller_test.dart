import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:mockito/mockito.dart';
import 'package:thefilme/api/api.dart';
import 'package:thefilme/home/home_controller.dart';
import 'package:thefilme/models/movie.dart';

class MockApi extends Mock implements Api {}

void main() {
  group('HomeController', () {
    late HomeController controller;
    late MockApi mockApi;

    setUp(() {
      mockApi = MockApi();
      controller = HomeController(api: mockApi);
    });

    test('fetchMovies success', () async {
      final trendingMovies = [
        Movie(
          title: 'Movie 1',
          backDropPath: 'path1',
          originalTitle: 'Original Title 1',
          overview: 'Overview 1',
          posterPath: 'poster1',
          releaseDate: '2022-01-01',
          voteAverage: 7.5,
        ),
        Movie(
          title: 'Movie 2',
          backDropPath: 'path2',
          originalTitle: 'Original Title 2',
          overview: 'Overview 2',
          posterPath: 'poster2',
          releaseDate: '2022-02-02',
          voteAverage: 8.0,
        ),
      ];

      final topRatedMovies = [
        Movie(
          title: 'Movie 3',
          backDropPath: 'path3',
          originalTitle: 'Original Title 3',
          overview: 'Overview 3',
          posterPath: 'poster3',
          releaseDate: '2022-03-03',
          voteAverage: 8.5,
        ),
        Movie(
          title: 'Movie 4',
          backDropPath: 'path4',
          originalTitle: 'Original Title 4',
          overview: 'Overview 4',
          posterPath: 'poster4',
          releaseDate: '2022-04-04',
          voteAverage: 9.0,
        ),
      ];

      final upcomingMovies = [
        Movie(
          title: 'Movie 5',
          backDropPath: 'path5',
          originalTitle: 'Original Title 5',
          overview: 'Overview 5',
          posterPath: 'poster5',
          releaseDate: '2022-05-05',
          voteAverage: 9.5,
        ),
        Movie(
          title: 'Movie 6',
          backDropPath: 'path6',
          originalTitle: 'Original Title 6',
          overview: 'Overview 6',
          posterPath: 'poster6',
          releaseDate: '2022-06-06',
          voteAverage: 9.8,
        ),
      ];

      when(mockApi.getTrendingMovies()).thenAnswer((_) async => trendingMovies);
      when(mockApi.getTopRatedMovies()).thenAnswer((_) async => topRatedMovies);
      when(mockApi.getUpcomingMovies()).thenAnswer((_) async => upcomingMovies);

      controller.fetchMovies();

      expect(controller.trendingMovies, trendingMovies);
      expect(controller.topRatedMovies, topRatedMovies);
      expect(controller.upcomingMovies, upcomingMovies);
      expect(controller.state, RxStatus.success());
    });

    test('fetchMovies error', () async {
      const error = 'Error fetching movies';

      when(mockApi.getTrendingMovies()).thenThrow(Exception(error));
      when(mockApi.getTopRatedMovies()).thenThrow(Exception(error));
      when(mockApi.getUpcomingMovies()).thenThrow(Exception(error));

      controller.fetchMovies();

      expect(controller.trendingMovies, isEmpty);
      expect(controller.topRatedMovies, isEmpty);
      expect(controller.upcomingMovies, isEmpty);
      expect(controller.state, RxStatus.error(error));
    });
  });
}
