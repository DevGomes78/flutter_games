import 'package:flutter/material.dart';
import 'package:flutter_games/models/game_model.dart';

class DetailsPage extends StatefulWidget {
  Results? results;

  DetailsPage({required this.results});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.black])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  widget.results!.cover.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    widget.results!.releaseDate.toString().substring(0, 4),
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  const Text('|'),
                  const SizedBox(width: 10),
                  Text(
                    widget.results!.publisher.toString(),
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  const Text('|'),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '8.5',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(widget.results!.description.toString()),
            )
          ],
        ),
      ),
    );
  }
}
