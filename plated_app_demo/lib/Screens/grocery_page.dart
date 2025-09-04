import 'package:flutter/material.dart';

// Grocery List Page Code
void main() {
  runApp(const GroceryListPage());
}

class GroceryListPage extends StatelessWidget {
  const GroceryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const GroceryListToBuy(),
    );
  }
}

class GroceryListToBuy extends StatefulWidget {
  const GroceryListToBuy({super.key});

  @override
  State<GroceryListToBuy> createState() => _GroceryListToBuyState();
}

class _GroceryListToBuyState extends State<GroceryListToBuy> {
  String? selectedCategory;
  bool isDropdownOpen = false;
  final GlobalKey dropdownKey = GlobalKey();
  OverlayEntry? overlayEntry;
  int selectedNavIndex = 4; // Shopping cart is selected by default

  final List<String> categories = [
    'All Items',
    'Fruits & Vegetables',
    'Dairy & Eggs',
    'Meat & Seafood',
    'Bakery',
  ];

  final List<GroceryItem> groceryItems = [
    GroceryItem(name: 'Apples', price: 2.50, quantity: 6),
    GroceryItem(name: 'Milk', price: 1.20, quantity: 1),
    GroceryItem(name: 'Bread', price: 0.85, quantity: 2),
    GroceryItem(name: 'Chicken', price: 5.99, quantity: 1),
    GroceryItem(name: 'Bananas', price: 1.80, quantity: 8),
    GroceryItem(name: 'Cheese', price: 3.25, quantity: 1),
    GroceryItem(name: 'Eggs', price: 2.10, quantity: 12),
    GroceryItem(name: 'Rice', price: 2.99, quantity: 1),
    GroceryItem(name: 'Tomatoes', price: 2.20, quantity: 4),
    GroceryItem(name: 'Pasta', price: 1.50, quantity: 2),
  ];

  void toggleDropdown() {
    if (isDropdownOpen) {
      closeDropdown();
    } else {
      openDropdown();
    }
  }

  void openDropdown() {
    final RenderBox renderBox =
        dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: closeDropdown,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 5,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAEBD7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF282626),
                    width: 0.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: categories.map((category) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                        closeDropdown();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Text(
                          category,
                          style: const TextStyle(
                            color: Color(0xFF282626),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
    setState(() {
      isDropdownOpen = true;
    });
  }

  void closeDropdown() {
    overlayEntry?.remove();
    overlayEntry = null;
    setState(() {
      isDropdownOpen = false;
    });
  }

  @override
  void dispose() {
    closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF2DA),
      body: Column(
        children: [
          // Header
          Container(
            width: screenWidth,
            height: statusBarHeight + 100,
            decoration: const BoxDecoration(color: Color(0xFFFFA838)),
            child: Padding(
              padding: EdgeInsets.only(
                top: statusBarHeight + 8,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top icons row
                  Row(
                    children: [
                      GestureDetector(
                        // onTap: () => print('Menu tapped'),
                        child: const Icon(Icons.menu,
                            color: Colors.white, size: 28),
                      ),
                      const Spacer(),
                      GestureDetector(
                        // onTap: () => print('Search tapped'),
                        child: const Icon(Icons.search,
                            color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        // onTap: () => print('Notifications tapped'),
                        child: const Icon(Icons.notifications_outlined,
                            color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        // onTap: () => print('Profile tapped'),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person,
                              color: Color(0xFFFFA838), size: 20),
                        ),
                      ),
                    ],
                  ),
                  // Grocery list text
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Text(
                        'Grocery list',
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

          // Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: screenWidth * 0.5, // Half the screen width
                child: GestureDetector(
                  key: dropdownKey,
                  onTap: toggleDropdown,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                        Expanded(
                          child: Text(
                            selectedCategory ?? 'Select an Option',
                            style: const TextStyle(
                              color: Color(0xFF282626),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          isDropdownOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: const Color(0xFF282626),
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Scrollable grocery items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                itemCount: groceryItems.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 13.58),
                itemBuilder: (context, index) {
                  final item = groceryItems[index];
                  return Container(
                    width: double.infinity,
                    height: 77.25,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFBDDB5),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.42,
                          color: Color(0xFF282626),
                        ),
                        borderRadius: BorderRadius.circular(89.98),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 61.8,
                            height: 61.8,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFBCA286),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                color: Color(0xFF282626),
                                fontSize: 16.18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            '£${item.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Color(0xFF282626),
                              fontSize: 16.18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Number: ${item.quantity}',
                            style: const TextStyle(
                              color: Color(0xFF282626),
                              fontSize: 16.18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Bottom Navigation
          Container(
            width: screenWidth,
            height: 100,
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            decoration: const BoxDecoration(color: Color(0xFF2F2F2E)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.receipt_outlined, 0),
                _buildNavItem(Icons.favorite_outline, 1),
                _buildNavItem(Icons.qr_code_scanner_outlined, 2),
                _buildNavItem(Icons.calendar_today_outlined, 3),
                _buildNavItem(Icons.shopping_cart_outlined, 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = selectedNavIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNavIndex = index;
        });
        // print('Nav item $index tapped');
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFA838) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

class GroceryItem {
  final String name;
  final double price;
  final int quantity;

  GroceryItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
