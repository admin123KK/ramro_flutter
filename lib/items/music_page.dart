import 'package:flutter/material.dart';


class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Music Slide'),
        ),
      ),
      body: Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 10,
        label: _currentSliderValue.round().toString(),
        onChanged: (value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
