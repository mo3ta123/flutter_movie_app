import 'dart:ui';

import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen(
      {Key? key,
      required this.title,
      required this.image,
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 66, 66),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Color.fromARGB(255, 187, 187, 187),
        ),
        title: const Text(
          'Back',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 187, 187, 187),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Container(
              color: Colors.black54,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 196, 195, 195),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '$rating/10',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$releaseDate',
                          style: TextStyle(
                              color: Color.fromARGB(255, 187, 187, 187),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Flexible(
                          child: Text(
                            '$overview',
                            style: TextStyle(
                                color: Color.fromARGB(255, 187, 187, 187),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 35,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.pink,
                  ),
                  iconSize: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
