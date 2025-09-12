import 'package:flutter/material.dart';

// Import the individual page files
import 'package:plated_app_demo/Screens/calendar_page.dart';
import 'package:plated_app_demo/Screens/favourites_page.dart';
import 'package:plated_app_demo/Screens/recipe_page.dart';
import 'package:plated_app_demo/Screens/pantry_page.dart';
import 'package:plated_app_demo/Screens/grocery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const MainNavigationWrapper(),
    );
  }
}

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int currentPageIndex = 2; // Start with Recipe Page (index 2)

  void onBottomNavTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;

    // Switch between pages based on current index
    switch (currentPageIndex) {
      case 0:
        currentPage = const CalendarScreen(); // From calendar_page.dart
      case 1:
        currentPage = const Favourites(); // From favourites_page.dart
      case 2:
        currentPage = const RecipePage(); // From recipe_page.dart
      case 3:
        currentPage = const PantryPage(); // From pantry_page.dart
      case 4:
        currentPage = const GroceryPage(); // From grocery_page.dart
      default:
        currentPage = const RecipePage(); // Default to Recipe page
    }

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentPageIndex,
        onTap: onBottomNavTap,
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  String? pressedIcon;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      color: const Color(0xFF2F2F2E),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: screenHeight * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomNavItem(Icons.calendar_today,
                  widget.currentIndex == 0, screenWidth, 'calendar', 0),
              _buildBottomNavItem(Icons.favorite_border,
                  widget.currentIndex == 1, screenWidth, 'favorite', 1),
              _buildDoubleStarIcon(screenWidth, 'stars', 2),
              _buildBottomNavItem(Icons.list, false, screenWidth, 'list', 3),
              _buildBottomNavItem(
                  Icons.shopping_cart_outlined, false, screenWidth, 'cart', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, bool isSelected, double screenWidth,
      String iconKey, int index) {
    final isPressed = pressedIcon == iconKey;

    return GestureDetector(
      onTapDown: (_) => setState(() => pressedIcon = iconKey),
      onTapUp: (_) => setState(() => pressedIcon = null),
      onTapCancel: () => setState(() => pressedIcon = null),
      onTap: () {
        if (index <= 5) {
          // Only handle implemented pages (0, 1, 2)
          widget.onTap(index);
        }
      },
      child: Container(
        width: screenWidth * 0.12,
        height: screenWidth * 0.12,
        decoration: isPressed
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.3),
              )
            : null,
        child: Center(
          child: Icon(
            icon,
            color: isSelected ? const Color(0xFFFFA838) : Colors.white,
            size: screenWidth * 0.06,
          ),
        ),
      ),
    );
  }

  Widget _buildDoubleStarIcon(double screenWidth, String iconKey, int index) {
    final isPressed = pressedIcon == iconKey;
    final isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTapDown: (_) => setState(() => pressedIcon = iconKey),
      onTapUp: (_) => setState(() => pressedIcon = null),
      onTapCancel: () => setState(() => pressedIcon = null),
      onTap: () {
        widget.onTap(index); // Navigate to Recipe page (index 2)
      },
      child: Container(
        width: screenWidth * 0.12,
        height: screenWidth * 0.12,
        decoration: isPressed
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.3),
              )
            : null,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: 8,
                top: 8,
                child: Icon(
                  Icons.star_border,
                  color: isSelected ? const Color(0xFFFFA838) : Colors.white,
                  size: screenWidth * 0.045,
                ),
              ),
              Positioned(
                right: 12,
                bottom: 12,
                child: Icon(
                  Icons.star_border,
                  color: isSelected ? const Color(0xFFFFA838) : Colors.white,
                  size: screenWidth * 0.045,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder implementations - replace with actual imports
// These are simplified versions just for the navigation to work
class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: CalendarScreen()),
    );
  }
}

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: FavouritesScreen()),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: RecipeScreen()),
    );
  }
}

class PantryPage extends StatelessWidget {
  const PantryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: PantryScreen()),
    );
  }
}

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: GroceryScreen()),
    );
  }
}
