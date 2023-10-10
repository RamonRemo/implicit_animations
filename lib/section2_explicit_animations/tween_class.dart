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

  final Animatable<double> _widthTween = Tween<double>(begin: 0, end: 300).chain(CurveTween(curve: Curves.easeInExpo));
  final ColorTween _colorTween =
      ColorTween(begin: Colors.red, end: Colors.green);

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(_updateState);
  }

  void _updateState() {
    // This is the wrong way to update, but we will fix this later.
    setState(() {});
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
              width: _widthTween.evaluate(_controller), // Replace with a tween that uses a Curve.
              height: 300,
              color: _colorTween.evaluate(_controller),
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
