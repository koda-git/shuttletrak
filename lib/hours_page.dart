
import 'package:flutter/material.dart';
// Assuming 'place.dart' might be needed for data; include other necessary imports based on the project's structure

class HoursPage extends StatelessWidget {
  const HoursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hours'),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // To evenly space the columns
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // To evenly space the rows
            children: <Widget>[
              Text('Monday: 9AM - 5PM'),
              Text('Tuesday: 9AM - 5PM'),
              Text('Wednesday: 9AM - 5PM'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // To evenly space the rows
            children: <Widget>[
              Text('Thursday: 9AM - 5PM'),
              Text('Friday: 9AM - 5PM'),
              Text('Saturday: Closed'),
            ],
          ),
        ],
      ),
    );
  }
}
