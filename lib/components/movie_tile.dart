import 'package:flutter/material.dart';
import '/screens/play_page.dart';

class MovieTile extends StatefulWidget {
  const MovieTile(
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
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayScreen(
              image: widget.image,
              title: widget.title,
              overview: widget.overview,
              rating: widget.rating,
              releaseDate: widget.releaseDate,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 48, 48, 48),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    widget.title,
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
          Positioned(
            top: 20,
            right: 20,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isFavourite = !_isFavourite;
                  });
                },
                icon: Icon(
                  _isFavourite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  color: Colors.pink,
                ),
                iconSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
