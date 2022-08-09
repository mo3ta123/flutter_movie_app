import 'package:flutter/material.dart';
import '/screens/play_page.dart';

class MovieSliderTile extends StatelessWidget {
  const MovieSliderTile(
      {Key? key,
      required this.image,
      required this.title,
      required this.overview,
      required this.rating,
      required this.releaseDate})
      : super(key: key);
  final String image;
  final String title;
  final String overview;
  final double rating;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayScreen(
              image: image,
              title: title,
              overview: overview,
              rating: rating,
              releaseDate: releaseDate,
            ),
          ),
        );
      },
      splashColor: Colors.white,
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            height: 200,
            width: 400,
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 187, 187, 187),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
