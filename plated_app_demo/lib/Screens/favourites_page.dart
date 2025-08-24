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
      home: const Scaffold(
        body: Favourites(),
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF2DA),
      body: Column(
        children: [
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
                // Favourites title
                Positioned(
                  left: screenWidth * 0.0775,
                  bottom: 4,
                  child: Text(
                    'Favourites',
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
                  'Your favourite content will appear here',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          // Bottom Navigation Bar
          Container(
            width: screenWidth,
            height: 60 + safeAreaBottom, // Content height + bottom safe area
            decoration: const BoxDecoration(color: Color(0xFF2F2F2E)),
            child: Padding(
              padding: EdgeInsets.only(bottom: safeAreaBottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Calendar icon
                  _buildBottomNavItem(
                    icon: Icons.calendar_today_outlined,
                    screenWidth: screenWidth,
                  ),
                  // Favourites icon (highlighted)
                  _buildBottomNavItem(
                    icon: Icons.favorite,
                    screenWidth: screenWidth,
                    isSelected: true,
                  ),
                  // Double star icon
                  _buildDoubleStarNavItem(screenWidth: screenWidth),
                  // List icon
                  _buildBottomNavItem(
                    icon: Icons.list_alt_outlined,
                    screenWidth: screenWidth,
                  ),
                  // Shopping cart icon
                  _buildBottomNavItem(
                    icon: Icons.shopping_cart_outlined,
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required double screenWidth,
    bool isSelected = false,
  }) {
    return SizedBox(
      width: screenWidth * 0.15,
      height: 60,
      child: IconButton(
        icon: Icon(
          icon,
          color: isSelected ? const Color(0xFFFFA838) : Colors.white,
          size: screenWidth * 0.06,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildDoubleStarNavItem({required double screenWidth}) {
    return SizedBox(
      width: screenWidth * 0.15,
      height: 60,
      child: IconButton(
        icon: SizedBox(
          width: screenWidth * 0.08,
          height: screenWidth * 0.08,
          child: Stack(
            children: [
              // Back star (bottom right)
              Positioned(
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                  size: screenWidth * 0.05,
                ),
              ),
              // Front star (top left)
              Positioned(
                left: 0,
                top: 0,
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                  size: screenWidth * 0.05,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
