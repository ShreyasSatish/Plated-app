// Plugin used to convert default page (first page) in Figma to Flutter code
// Plugin trialed is called CodeTea
// Some code was adjusted by AI for UI layout purposes

import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              // use local asset; see pubspec step below
              'assets/images/hero_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // A subtle dark overlay to make text/buttons pop (optional)
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.15)),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/plated_logo_orange.png',
                    width: 220,
                  ),
                ),

                // Push content down so buttons sit lower
                const Spacer(),

                // Buttons block
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7C55),
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 2,
                          ),
                          child: const Text('Log in',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(color: Colors.white, width: 2),
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Sign up',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
