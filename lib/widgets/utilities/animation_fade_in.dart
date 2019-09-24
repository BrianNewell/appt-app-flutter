import 'package:flutter/material.dart';

class AnimationFadeIn extends StatefulWidget {
  final Widget child;

  AnimationFadeIn({
    Key key,
    @required this.child,
  }) : super(key: key);

  _AnimationFadeInState createState() => _AnimationFadeInState();
}

class _AnimationFadeInState extends State<AnimationFadeIn>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
