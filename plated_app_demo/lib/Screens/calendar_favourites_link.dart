import 'package:flutter/material.dart';

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

// Recipe Page Screen (modified to remove bottom nav and main wrapper)
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
}

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    const CalendarScreen(),
    const Favourites(),
  ];

  void onBottomNavTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
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
              _buildDoubleStarIcon(screenWidth, 'stars'),
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
        if (index < 2) {
          // Only handle calendar (0) and favorites (1)
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

  Widget _buildDoubleStarIcon(double screenWidth, String iconKey) {
    final isPressed = pressedIcon == iconKey;

    return GestureDetector(
      onTapDown: (_) => setState(() => pressedIcon = iconKey),
      onTapUp: (_) => setState(() => pressedIcon = null),
      onTapCancel: () => setState(() => pressedIcon = null),
      onTap: () {
        // Handle double star tap - not implemented yet
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
                  color: Colors.white,
                  size: screenWidth * 0.045,
                ),
              ),
              Positioned(
                right: 12,
                bottom: 12,
                child: Icon(
                  Icons.star_border,
                  color: Colors.white,
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

// Calendar Screen (modified to remove bottom nav and main wrapper)
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int? selectedDay;
  bool isSavePressed = false;
  DateTime currentDate = DateTime.now(); // Start with current month and year
  final TextEditingController _whatToEatController = TextEditingController();
  final TextEditingController _whenToEatController = TextEditingController();

  void _previousMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1);
      selectedDay = null; // Clear selection when changing months
    });
  }

  void _nextMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
      selectedDay = null; // Clear selection when changing months
    });
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  int _getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  int _getFirstDayOfWeek(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    // Convert to Monday = 0, Sunday = 6
    return (firstDay.weekday - 1) % 7;
  }

  List<int> _getPreviousMonthDays(DateTime date) {
    final prevMonth = DateTime(date.year, date.month - 1);
    final daysInPrevMonth = _getDaysInMonth(prevMonth);
    final firstDayOffset = _getFirstDayOfWeek(date);

    final prevDays = <int>[];
    for (int i = firstDayOffset - 1; i >= 0; i--) {
      prevDays.add(daysInPrevMonth - i);
    }
    return prevDays;
  }

  @override
  void dispose() {
    _whatToEatController.dispose();
    _whenToEatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF1DA),
      body: Column(
        children: [
          // Header - extends to top of screen
          Container(
            width: double.infinity,
            height: screenHeight * 0.15, // 15% of screen height
            color: const Color(0xFFFFA838),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.01,
                ),
                child: Stack(
                  children: [
                    // Navigation icons
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Icon(Icons.menu,
                          color: Colors.white, size: screenWidth * 0.07),
                    ),
                    Positioned(
                      right: screenWidth * 0.1,
                      top: 0,
                      child: Icon(Icons.notifications,
                          color: Colors.white, size: screenWidth * 0.07),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Icon(Icons.account_circle,
                          color: Colors.white, size: screenWidth * 0.07),
                    ),
                    // Title
                    Positioned(
                      left: 2,
                      bottom: -screenHeight * 0.01,
                      child: Text(
                        'Calendar',
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
            ),
          ),

          // Main content area
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.025),
              child: Column(
                children: [
                  // Calendar Container
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(screenWidth * 0.075),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Month header with navigation
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${_getMonthName(currentDate.month)} ${currentDate.year}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.06,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: _previousMonth,
                                  icon: const Icon(Icons.chevron_left),
                                  iconSize: screenWidth * 0.05,
                                ),
                                IconButton(
                                  onPressed: _nextMonth,
                                  icon: const Icon(Icons.chevron_right),
                                  iconSize: screenWidth * 0.05,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.015),

                        // Calendar Grid
                        _buildCalendarGrid(),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Form Section
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.25,
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFBDDB5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        // What to eat input
                        _buildInputField(
                          controller: _whatToEatController,
                          hintText: 'What to eat today?',
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        SizedBox(height: screenHeight * 0.018),
                        // When to eat input
                        _buildInputField(
                          controller: _whenToEatController,
                          hintText: 'When to eat?',
                          suffixIcon: Icons.access_time,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        const Spacer(),
                        // Save button
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTapDown: (_) =>
                                setState(() => isSavePressed = true),
                            onTapUp: (_) =>
                                setState(() => isSavePressed = false),
                            onTapCancel: () =>
                                setState(() => isSavePressed = false),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.06,
                                vertical: screenHeight * 0.01,
                              ),
                              decoration: ShapeDecoration(
                                color: isSavePressed
                                    ? const Color(0xFFFFA838)
                                    : const Color(0xFF0F5F11),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(524),
                                ),
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.038,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final screenWidth = MediaQuery.of(context).size.width;
    const daysOfWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return Column(
      children: [
        // Day headers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: daysOfWeek
                .map((day) => Expanded(
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        child: Text(
                          day,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.035,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),

        // Calendar days
        _buildCalendarDays(),
      ],
    );
  }

  Widget _buildCalendarDays() {
    final screenWidth = MediaQuery.of(context).size.width;

    final daysInMonth = _getDaysInMonth(currentDate);
    final firstDayOffset = _getFirstDayOfWeek(currentDate);
    final previousMonthDays = _getPreviousMonthDays(currentDate);

    final List<Widget> weeks = [];
    final List<Widget> allDays = [];

    // Add previous month days (grayed out) based on firstDayOffset
    for (final day in previousMonthDays) {
      allDays
          .add(_buildDayCell(day, isPrevMonth: true, screenWidth: screenWidth));
    }

    // Add current month days
    for (int day = 1; day <= daysInMonth; day++) {
      allDays.add(_buildDayCell(day, screenWidth: screenWidth));
    }

    // Add next month days to fill the grid (complete weeks)
    final totalCells = allDays.length;
    final cellsNeeded = ((totalCells / 7).ceil() * 7);
    for (int day = 1; allDays.length < cellsNeeded; day++) {
      allDays
          .add(_buildDayCell(day, isNextMonth: true, screenWidth: screenWidth));
    }

    // Group days into weeks
    for (int i = 0; i < allDays.length; i += 7) {
      final weekDays = allDays.skip(i).take(7).toList();
      weeks.add(_buildWeekRow(weekDays));
    }

    return Column(children: weeks);
  }

  Widget _buildWeekRow(List<Widget> days) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(children: days),
    );
  }

  Widget _buildDayCell(int day,
      {bool isPrevMonth = false,
      bool isNextMonth = false,
      required double screenWidth}) {
    final isSelected = !isPrevMonth && !isNextMonth && selectedDay == day;

    return Expanded(
      child: GestureDetector(
        onTap: (isPrevMonth || isNextMonth)
            ? null
            : () {
                setState(() {
                  // Toggle selection - if already selected, deselect it
                  if (selectedDay == day) {
                    selectedDay = null;
                  } else {
                    selectedDay = day;
                  }
                });
              },
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.025),
          decoration: ShapeDecoration(
            color: isSelected
                ? const Color(0xFFFFA838)
                : (isPrevMonth || isNextMonth)
                    ? const Color(0xFFF2F2F7)
                    : Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFFD4D3DF),
              ),
            ),
          ),
          child: Text(
            day.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (isPrevMonth || isNextMonth)
                  ? const Color(0xFFA7A7A7)
                  : isSelected
                      ? Colors.white
                      : Colors.black,
              fontSize: screenWidth * 0.035,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    IconData? suffixIcon,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.045,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFF8B8B8B),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Color(0xFF333333), // Darker grey for typed text
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF8B8B8B),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: const Color(0xFF8B8B8B), size: 16)
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.01,
          ),
        ),
      ),
    );
  }
}

// Favourites Screen (modified to remove bottom nav and main wrapper)
class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final safeAreaTop = MediaQuery.of(context).padding.top;

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
                  'Your favourite recipes will appear here!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
