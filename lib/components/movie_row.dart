import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MovieRow extends StatelessWidget {
  const MovieRow({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: GoogleFonts.aBeeZee(fontSize: 25),
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.teal,
                    width: 200,
                    height: 150,
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
