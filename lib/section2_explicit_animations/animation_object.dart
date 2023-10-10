import 'package:flutter/material.dart';

// theres also a proxy animation, a revese animation and a trainhoppinganimation

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  final Tween<double> _widthTween = Tween<double>(begin: 0, end: 300);
  late Animation<int> _counterAnimation;
  late CurvedAnimation _curvedAnimation;
  // late ReverseAnimation _anime;
  final ColorTween _colorTween =
      ColorTween(begin: Colors.red, end: Colors.green);
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(_updateState);
    _counterAnimation = IntTween(begin: 0, end: 100).animate(_controller);
    _counterAnimation.addListener(() {
      print(_counterAnimation.value);
    });
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
      reverseCurve: Curves.easeOut,
    );
    _colorAnimation = _colorTween.animate(_controller);
    // _anime = ReverseAnimation(_controller);
  }

  void _updateState() {
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
              width: _widthTween.evaluate(_curvedAnimation),
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
