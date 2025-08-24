import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const DefaultPage(),
    );
  }
}

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: Color(0xFF2F2F2F),
        ),
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/default_background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Dark overlay to ensure text visibility
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),

            // Logo
            Positioned(
              left: screenWidth * 0.1,
              top: screenHeight * 0.15,
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/plated_logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Log in button
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.65,
              child: CustomButton(
                text: 'Log in',
                width: screenWidth * 0.5,
                onPressed: () {
                  // TODO: Add your log in functionality here
                  // print('Log in pressed');
                },
              ),
            ),

            // Sign up button
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.75,
              child: CustomButton(
                text: 'Sign up',
                width: screenWidth * 0.5,
                onPressed: () {
                  // TODO: Add your sign up functionality here
                  // print('Sign up pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String text;
  final double width;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: ShapeDecoration(
          color: _isPressed
              ? const Color(0xFF2E8B57) // Dark jade green when pressed
              : const Color(0xFFFF7C55), // Original orange color
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.transparent),
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
