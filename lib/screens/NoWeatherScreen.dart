import 'package:flutter/material.dart';

class NoWeatherScreen extends StatelessWidget {
  const NoWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'No Weather, Searching Now',
                style: TextStyle(
                 color: Color.fromARGB(255, 2, 53, 95),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            //  Text(
            //     ' ',
            //     style: TextStyle(
            //       color: Color.fromARGB(255, 2, 53, 95),
            //       fontWeight: FontWeight.bold,
            //       fontSize: 29,
            //     ),
            //   )
            ],
          ),
        );
  }
}
