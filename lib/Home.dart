import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class TweenAnimationApp extends StatefulWidget {
  const TweenAnimationApp({super.key});

  @override
  TweenAnimationAppState createState() => TweenAnimationAppState();
}

class TweenAnimationAppState extends State<TweenAnimationApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Create a Tween that moves a widget from 0 to 300 along the X-axis
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);

    // Start the animation automatically
    _controller.addListener(() {
      setState(() {});
    });
  }

  // Dispose the controller when no longer needed
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to start and stop the animation
  void _toggleAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _animation.value, // Animating the X position
            top: 100, // Fixed Y position
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAnimation,
        child: Icon(
          _controller.isAnimating ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
