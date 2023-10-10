import 'package:flutter/material.dart';

class TweenAnimationBuilderExample2 extends StatefulWidget {
  const TweenAnimationBuilderExample2({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilderExample2> createState() =>
      _TweenAnimationBuilderExample2State();
}

class _TweenAnimationBuilderExample2State
    extends State<TweenAnimationBuilderExample2> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: targetValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return IconButton(
          iconSize: size,
          color: Colors.blue,
          icon: child!,
          onPressed: () {
            setState(() {
              targetValue = targetValue == 24.0 ? 48.0 : 24.0;
            });
          },
        );
      },
      child: const Icon(Icons.aspect_ratio),
    );
  }
}
