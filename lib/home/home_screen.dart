import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thefilme/api/api.dart';
import 'package:thefilme/models/movie.dart';
import 'package:thefilme/widgets/movie_row.dart';
import 'package:thefilme/widgets/trending_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    super.initState();

    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'The Filme',
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
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingRow(
                        title: "Mais populares",
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const MovieRow(title: 'Melhor avaliados'),
              const MovieRow(title: 'Lançamentos')
            ],
          ),
        ),
      ),
    );
  }
}

//  a5953675fff3e8f58ffa91fe4d8753ef
