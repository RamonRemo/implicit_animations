
import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  _TweenAnimationExampleState createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample> {
  double _redSlider = 0;
  double _greenSlider = 0;
  double _blueSlider = 0;

  Color _endColor = Colors.black;

  void _updateColor() {
    setState(() {
      _endColor = Color.fromRGBO((_redSlider * 255).toInt(),
          (_greenSlider * 255).toInt(), (_blueSlider * 255).toInt(), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TweenAnimationBuilder(
          tween: ColorTween(begin: Colors.white, end: _endColor),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, Color? color, Widget? child) {
            return Icon(
              Icons.apps,
              size: 124,
              color: color,
            );
          },
          child: const Icon(Icons.apps),
        ),
        Slider(
          inactiveColor: Colors.black87,
          activeColor: Colors.red,
          onChanged: (double value) {
            _redSlider = value;
            _updateColor();
          },
          value: _redSlider,
        ),
        Slider(
          inactiveColor: Colors.black87,
          activeColor: Colors.green,
          onChanged: (double value) {
            _greenSlider = value;
            _updateColor();
          },
          value: _greenSlider,
        ),
        Slider(
          inactiveColor: Colors.black87,
          activeColor: Colors.blue,
          onChanged: (double value) {
            _blueSlider = value;
            _updateColor();
          },
          value: _blueSlider,
        ),
      ],
    );
  }
}
