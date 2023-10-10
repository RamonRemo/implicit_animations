import 'package:flutter/material.dart';
import 'package:implicit_animations/section1_implicit_animations/animations/tween_animation_builder.dart';
import 'package:implicit_animations/section1_implicit_animations/animations/tween_animation_builder2.dart';

import 'section1_implicit_animations/animations/align.dart';
import 'section1_implicit_animations/animations/container.dart';
import 'section1_implicit_animations/animations/cross_fade.dart';
import 'section1_implicit_animations/animations/default_text_style.dart';
import 'section1_implicit_animations/animations/opacity.dart';
import 'section1_implicit_animations/animations/padding.dart';
import 'section1_implicit_animations/animations/physical_model.dart';
import 'section1_implicit_animations/animations/positioned.dart';
import 'styles.dart';
import 'widgets/demo_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Implicit Animations',
      theme: theme,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Implicit Animations'),
          ),
          body: const ImplicitAnimations()),
    );
  }
}

class ImplicitAnimations extends StatelessWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        DemoPage(title: 'Container', child: ContainerExample()),
        DemoPage(title: 'Cross Fade', child: CrossFadeExample()),
        DemoPage(title: 'Physical Model', child: PhysicalModelExample()),
        DemoPage(title: 'Opacity', child: OpacityExample()),
        DemoPage(title: 'Default Text Style', child: DefaultTextStyleExample()),
        DemoPage(title: 'Align', child: AlignExample()),
        DemoPage(title: 'Padding', child: PaddingExample()),
        DemoPage(title: 'Positioned', child: PositionedExample()),
        DemoPage(title: 'TweenBuilder', child: TweenAnimationExample()),
        DemoPage(title: 'TweenBuilder2', child: TweenAnimationBuilderExample2())
      ],
    );
  }
}
