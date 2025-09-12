import 'package:flutter/material.dart';

// Pantry Page Code - index 3 on bottom nav bar (from left to right)

class PantryScreen extends StatefulWidget {
  const PantryScreen({super.key});

  @override
  State<PantryScreen> createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  bool isDropdownOpen = false;
  List<Map<String, dynamic>> pantryItems = [
    {'name': 'Apples', 'quantity': '5'},
    {'name': 'Bread', 'quantity': '2'},
    {'name': 'Milk', 'quantity': '1'},
    {'name': 'Eggs', 'quantity': '12'},
    {'name': 'Cheese', 'quantity': '3'},
    {'name': 'Tomatoes', 'quantity': '8'},
    {'name': 'Rice', 'quantity': '2kg'},
    {'name': 'Pasta', 'quantity': '4'},
  ];

  final List<String> availableIngredients = [
    'Flour',
    'Sugar',
    'Butter',
    'Onions',
    'Garlic',
    'Chicken',
    'Beef',
    'Fish',
    'Potatoes',
    'Carrots',
  ];

  int selectedBottomIndex = 2; // Pantry is selected by default

  void addIngredient(String ingredient) {
    setState(() {
      pantryItems.add({'name': ingredient, 'quantity': '1'});
      isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFFFFF2DA),
        body: Stack(children: [
          Column(
            children: [
              // Top Navigation Bar
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(color: Color(0xFFFFA838)),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                // print('Menu pressed');
                              },
                              icon: const Icon(Icons.menu,
                                  color: Colors.white, size: 24),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // print('Search pressed');
                                  },
                                  icon: const Icon(Icons.search,
                                      color: Colors.white, size: 24),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // print('Notifications pressed');
                                  },
                                  icon: const Icon(Icons.notifications_outlined,
                                      color: Colors.white, size: 24),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.02,
                              bottom: screenHeight * 0.01,
                            ),
                            child: const Text(
                              'Pantry',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Add Ingredients Dropdown Button (fixed position)
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDropdownOpen = !isDropdownOpen;
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.5,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.015,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFAEBD7),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.50,
                            color: Color(0xFF282626),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Add Ingredients',
                            style: TextStyle(
                              color: Color(0xFF282626),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            isDropdownOpen
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: const Color(0xFF282626),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Scrollable Ingredients List
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: ListView.builder(
                    itemCount: pantryItems.length,
                    itemBuilder: (context, index) {
                      final item = pantryItems[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * 0.11, // 11% of screen height
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFBDDB5),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.50,
                                color: Color(0xFF282626),
                              ),
                              borderRadius: BorderRadius.circular(106),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenHeight * 0.09,
                                  height: screenHeight * 0.09,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFBCA286),
                                    shape: OvalBorder(),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.05),
                                    child: Text(
                                      item['name'],
                                      style: const TextStyle(
                                        color: Color(0xFF282626),
                                        fontSize: 19.06,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '#: ${item['quantity']}',
                                  style: const TextStyle(
                                    color: Color(0xFF282626),
                                    fontSize: 19.06,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Floating Dropdown Menu (overlays on top)
              if (isDropdownOpen)
                Positioned(
                  left: screenWidth * 0.02,
                  top: screenHeight * 0.21, // Adjusted position
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: screenWidth * 0.5,
                      constraints:
                          BoxConstraints(maxHeight: screenHeight * 0.25),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAEBD7),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.5, color: const Color(0xFF282626)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ListView.builder(
                          padding: EdgeInsets.zero, // Remove default padding
                          shrinkWrap: true,
                          itemCount: availableIngredients.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () =>
                                  addIngredient(availableIngredients[index]),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05,
                                  vertical: screenHeight * 0.012,
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      index < availableIngredients.length - 1
                                          ? const Border(
                                              bottom: BorderSide(
                                                  width: 0.25,
                                                  color: Color(0xFFBCA286)))
                                          : null,
                                ),
                                child: Text(
                                  availableIngredients[index],
                                  style: const TextStyle(
                                    color: Color(0xFF282626),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ]));
  }
}
