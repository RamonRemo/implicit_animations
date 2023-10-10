import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Course',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Explicit Animations'),
          ),
          body: const AnimationControllerExample()),
    );
  }
}

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({Key? key}) : super(key: key);

  @override
  _AnimationControllerExampleState createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int counter = 0;
  double _width = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      counter++;
      print('progress: ${_controller.value}');
      print('duration: ${_controller.lastElapsedDuration}');
      print('counter: $counter');
      _setWidth(_controller.value * 300);
    });
  }

  void _setWidth(double val) {
    setState(() {
      _width = val;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: _width,
              height: 300,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _controller.repeat(reverse: true);
              },
              child: const Text('Repeat'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.stop();
              },
              child: const Text('Stop'),
            )
          ],
        ),
      ],
    );
  }
}
