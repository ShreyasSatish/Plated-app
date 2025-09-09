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
      home: Scaffold(
        body: ListView(children: [
          SettingsPage(),
        ]),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              // Background
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 393,
                  height: 852,
                  decoration: BoxDecoration(color: const Color(0xFF2E2E2E)),
                ),
              ),
              // Orange header
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 393,
                  height: 152,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFA838),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              // Back button
              Positioned(
                left: 10,
                top: 7,
                child: Container(
                  width: 51,
                  height: 51,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFA838),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(524),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              // Main content container
              Positioned(
                left: 0,
                top: 131,
                child: Container(
                  width: 393,
                  height: 623,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF202020),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x51131313),
                        blurRadius: 16,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              // Settings title with gear icon
              Positioned(
                left: 24,
                top: 76.03,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.98,
                      ),
                    ),
                  ],
                ),
              ),
              // User profile section
              Positioned(
                left: 41,
                top: 152,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF2E2E2E),
                    size: 24,
                  ),
                ),
              ),
              Positioned(
                left: 93,
                top: 162,
                child: Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Account Settings section header
              Positioned(
                left: 41,
                top: 240,
                child: Text(
                  'Account Settings',
                  style: TextStyle(
                    color: const Color(0xFFADADAD),
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Edit profile
              Positioned(
                left: 41,
                top: 293,
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Edit profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow for Edit profile
              Positioned(
                left: 360,
                top: 295,
                child: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFADADAD),
                  size: 20,
                ),
              ),
              // Change password
              Positioned(
                left: 41,
                top: 348,
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Change password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow for Change password
              Positioned(
                left: 360,
                top: 350,
                child: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFADADAD),
                  size: 20,
                ),
              ),
              // Upgrade Subscription
              Positioned(
                left: 41,
                top: 407,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Upgrade Subscription',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Plus icon for Upgrade Subscription
              Positioned(
                left: 360,
                top: 409,
                child: Icon(
                  Icons.add,
                  color: Color(0xFFADADAD),
                  size: 20,
                ),
              ),
              // Notifications
              Positioned(
                left: 41,
                top: 464,
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Toggle switch for Notifications
              Positioned(
                left: 326,
                top: 465,
                child: Container(
                  width: 32,
                  height: 20,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2D68FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4000),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 14,
                        top: 2,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // About us
              Positioned(
                left: 41,
                top: 515,
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'About us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow for About us
              Positioned(
                left: 360,
                top: 517,
                child: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFADADAD),
                  size: 20,
                ),
              ),
              // Privacy policy
              Positioned(
                left: 41,
                top: 570,
                child: Row(
                  children: [
                    Icon(
                      Icons.privacy_tip,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Privacy policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow for Privacy policy
              Positioned(
                left: 360,
                top: 572,
                child: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFADADAD),
                  size: 20,
                ),
              ),
              // Terms and conditions
              Positioned(
                left: 41,
                top: 626,
                child: Row(
                  children: [
                    Icon(
                      Icons.description,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Terms and conditions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow for Terms and conditions
              Positioned(
                left: 360,
                top: 628,
                child: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFADADAD),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}