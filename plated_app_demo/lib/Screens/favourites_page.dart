import 'package:flutter/material.dart';

// FavouritesScreen Page Code - index 1 on bottom nav bar (from left to right)

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: const Color(0xFFFFF2DA),
        body: Column(children: [
          // Header Section
          Container(
            width: screenWidth,
            height: safeAreaTop + 80, // Status bar height + header content
            decoration: const BoxDecoration(color: Color(0xFFFFA838)),
            child: Stack(
              children: [
                // Menu icon (hamburger)
                Positioned(
                  left: screenWidth * 0.05,
                  top: safeAreaTop + 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
                // Notification bell icon
                Positioned(
                  right: screenWidth * 0.15,
                  top: safeAreaTop + 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
                // Profile icon
                Positioned(
                  right: screenWidth * 0.05,
                  top: safeAreaTop + 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
                // FavouritesScreen title
                Positioned(
                  left: screenWidth * 0.0775,
                  bottom: 4,
                  child: Text(
                    'FavouritesScreen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.06,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Container(
              width: screenWidth,
              color: const Color(0xFFFFF2DA),
              child: const Center(
                child: Text(
                  'Your favourite recipes will appear here!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
