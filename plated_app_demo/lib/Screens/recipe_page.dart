import 'package:flutter/material.dart';

// Recipe Page Code - index 2 on bottom nav bar (from left to right)
void main() {
  runApp(const RecipePageScreen());
}

class RecipePageScreen extends StatelessWidget {
  const RecipePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const RecipePage(),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF2DA),
      body: Column(
        children: [
          // Top Navigation Bar - extends to top fully
          Container(
            width: double.infinity,
            height: screenHeight * 0.13, // 13% of screen height
            decoration: const BoxDecoration(
              color: Color(0xFFFFA838),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05), // 5% padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Triple dot icon in top left
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: screenWidth * 0.06, // 6% of screen width
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home Page',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    screenWidth * 0.06, // 6% of screen width
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.08, // 8% of screen width
                          height: screenWidth * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.04),
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.025),
                        Container(
                          width: screenWidth * 0.07, // 7% of screen width
                          height: screenWidth * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.035),
                          ),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: screenWidth * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% of screen width
              vertical: screenHeight * 0.025, // 2.5% of screen height
            ),
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.055, // 5.5% of screen height
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.01,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFF8B8B8B),
                  ),
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'What to eat?',
                    style: TextStyle(
                      color: const Color(0xFF8B8B8B),
                      fontSize: screenWidth * 0.03, // 3% of screen width
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Filter Tags
          Container(
            height: screenHeight * 0.06, // 6% of screen height
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFilterTag('Indian', screenWidth, screenHeight),
                _buildFilterTag('Italian', screenWidth, screenHeight),
                _buildFilterTag('African', screenWidth, screenHeight),
                _buildFilterTag('Mexican', screenWidth, screenHeight),
                _buildFilterTag('Thai', screenWidth, screenHeight),
                _buildFilterTag('Chinese', screenWidth, screenHeight),
                _buildFilterTag('Greek', screenWidth, screenHeight),
                _buildFilterTag('Turkish', screenWidth, screenHeight),
                _buildFilterTag('Lebanese', screenWidth, screenHeight),
                _buildFilterTag('Caribbean', screenWidth, screenHeight),
                _buildFilterTag('Australian', screenWidth, screenHeight),
                _buildFilterTag('Arabic', screenWidth, screenHeight),
                _buildFilterTag('Korean', screenWidth, screenHeight),
                _buildFilterTag('Vietnamese', screenWidth, screenHeight),
                _buildFilterTag('Spanish', screenWidth, screenHeight),
                _buildFilterTag('Japanese', screenWidth, screenHeight),
                _buildFilterTag('American', screenWidth, screenHeight),
                _buildFilterTag('British', screenWidth, screenHeight),
                _buildFilterTag('French', screenWidth, screenHeight),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02), // 2% of screen height

          // Recipe Cards
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: screenWidth * 0.025,
                  mainAxisSpacing: screenHeight * 0.015,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6, // Show 6 cards for demo
                itemBuilder: (context, index) {
                  final cuisines = [
                    'Indian',
                    'Italian',
                    'African',
                    'Mexican',
                    'Thai',
                    'Chinese'
                  ];
                  return _buildRecipeCard(cuisines[index % cuisines.length],
                      screenWidth, screenHeight);
                },
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: screenHeight * 0.09, // 9% of screen height
        decoration: const BoxDecoration(
          color: Color(0xFF2F2F2E),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(Icons.calendar_month, false, screenWidth),
            _buildBottomNavItem(Icons.favorite_outline, false, screenWidth),
            _buildBottomNavItem(Icons.home, true, screenWidth), // Active item
            _buildBottomNavItem(Icons.receipt_long, false, screenWidth),
            _buildBottomNavItem(
                Icons.shopping_cart_outlined, false, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTag(String text, double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.018,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFDC9C),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.42),
          borderRadius: BorderRadius.circular(screenWidth * 0.018),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.035, // 3% of screen width
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildRecipeCard(
      String cuisine, double screenWidth, double screenHeight) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFBDDB5),
        borderRadius: BorderRadius.circular(screenWidth * 0.025),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10,
            offset: Offset(2, 2),
            spreadRadius: 0,
          )
        ],
      ),
      padding: EdgeInsets.all(screenWidth * 0.03), // 3% padding
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Recipe Image Placeholder
          Container(
            width: screenWidth * 0.2, // 20% of screen width
            height: screenWidth * 0.2,
            decoration: ShapeDecoration(
              color: const Color(0xFFBBA186),
              shape: OvalBorder(side: BorderSide(width: screenWidth * 0.008)),
            ),
          ),

          SizedBox(height: screenHeight * 0.01),

          // Recipe Info
          Column(
            children: [
              Text(
                'Recipe name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF282626),
                  fontSize: screenWidth * 0.03, // 3% of screen width
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                'Rating: 8/10',
                style: TextStyle(
                  color: const Color(0xFF282626),
                  fontSize: screenWidth * 0.025, // 2.5% of screen width
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.003),
              Text(
                'Time: 30 mins',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF282626),
                  fontSize: screenWidth * 0.025, // 2.5% of screen width
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                cuisine,
                style: TextStyle(
                  color: const Color(0xFF282626),
                  fontSize: screenWidth * 0.022, // 2.2% of screen width
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.01),

          // More Button
          Container(
            width: screenWidth * 0.2, // 20% of screen width
            height: screenHeight * 0.035, // 3.5% of screen height
            decoration: ShapeDecoration(
              color: const Color(0xFF0F5F11),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
            ),
            child: Center(
              child: Text(
                'More',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03, // 3% of screen width
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, bool isActive, double screenWidth) {
    return Container(
      width: screenWidth * 0.12, // 12% of screen width
      height: screenWidth * 0.12,
      decoration: isActive
          ? BoxDecoration(
              color: const Color(0xFFFFA838),
              borderRadius: BorderRadius.circular(screenWidth * 0.025),
            )
          : null,
      child: Icon(
        icon,
        color: Colors.white,
        size: screenWidth * 0.06, // 6% of screen width
      ),
    );
  }
}
