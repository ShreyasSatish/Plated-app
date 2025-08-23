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
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Content overlay
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final screenHeight = constraints.maxHeight;
                  final screenWidth = constraints.maxWidth;

                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidth * 0.076), // ~30px on 393px width
                    child: Column(
                      children: [
                        // Position welcome text at ~38% from top
                        SizedBox(height: screenHeight * 0.38),

                        // Welcome text
                        Text(
                          'Welcome to Plated!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFFA838),
                            fontSize:
                                screenWidth * 0.081, // ~32px on 393px width
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(
                            height:
                                screenHeight * 0.014), // ~12px on 852px height

                        // Subtitle
                        Text(
                          'Meals made your way',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFFA838),
                            fontSize:
                                screenWidth * 0.051, // ~20px on 393px width
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // Flexible spacer to push bottom content down
                        const Expanded(child: SizedBox()),

                        // Bottom section with text and button
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Let\'s personalise your meal experience...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth *
                                      0.051, // ~20px on 393px width
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.041), // ~16px

                            // Arrow button
                            Container(
                              width: screenWidth * 0.14, // ~55px on 393px width
                              height: screenWidth * 0.14, // Keep it square
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFA838),
                                shape: CircleBorder(
                                  side: BorderSide(
                                    width: screenWidth * 0.005, // ~2px
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: screenWidth * 0.061, // ~24px
                              ),
                            ),
                          ],
                        ),

                        // Bottom padding
                        SizedBox(
                            height:
                                screenHeight * 0.059), // ~50px on 852px height
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
