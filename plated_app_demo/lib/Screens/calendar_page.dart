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
      home: const CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int? selectedDay;
  bool isSavePressed = false;
  DateTime currentDate = DateTime(2025, 8); // Start with August 2025
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
                      left: 0,
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

          // Bottom Navigation - extends to bottom of screen
          Container(
            width: double.infinity,
            color: const Color(0xFF2F2F2E),
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: screenHeight * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomNavItem(
                        Icons.calendar_today, true, screenWidth),
                    _buildBottomNavItem(
                        Icons.favorite_border, false, screenWidth),
                    _buildBottomNavItem(Icons.event, false, screenWidth),
                    _buildBottomNavItem(Icons.menu_book, false, screenWidth),
                    _buildBottomNavItem(
                        Icons.shopping_cart, false, screenWidth),
                  ],
                ),
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

  Widget _buildBottomNavItem(
      IconData icon, bool isSelected, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.08,
      height: screenWidth * 0.08,
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFFFFA838) : Colors.white,
        size: screenWidth * 0.06,
      ),
    );
  }
}
