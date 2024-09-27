import 'package:flutter/material.dart';
import 'dart:async';
import 'calculator_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // Set a timer to transition to the calculator screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CalculatorScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransitionScreen(),
      ),
    );
  }
}

class FadeTransitionScreen extends StatefulWidget {
  @override
  _FadeTransitionScreenState createState() => _FadeTransitionScreenState();
}

class _FadeTransitionScreenState extends State<FadeTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Use 'late' to initialize later
  late Animation<double> _fadeAnimation; // Ensure type is Animation<double>

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and fade animation
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Assign the fade animation with correct type
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward(); // Start the fade animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation, // _fadeAnimation is of type Animation<double>
      child: Text(
        "Welcome to GVSR's Calculator",
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
