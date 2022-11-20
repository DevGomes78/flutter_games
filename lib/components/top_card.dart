import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopCard extends StatefulWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 20,
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.white,
            ),
          ),
          const Positioned(
            left: 20,
            top: 60,
            child: Text(
              'Browse games',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 110,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26),
              height: 120,
              width: 300,
              child: Stack(
                children: [
                  Positioned(
                    left: 5,
                    top: 5,
                    child: Container(
                      height: 130,
                      width: 130,
                      child: Image.asset('image/over.png'),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
