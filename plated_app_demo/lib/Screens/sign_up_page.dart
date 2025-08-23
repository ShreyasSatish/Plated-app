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
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header image section
              Container(
                width: screenWidth,
                height: screenHeight * 0.25, // 25% of screen height
                decoration: const BoxDecoration(
                  color: Color(0xFF2a2a2a),
                  image: DecorationImage(
                    image: AssetImage("assets/images/sign_up_background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  // Add lighter dark overlay to make logo more visible while keeping background visible
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                  child: Stack(
                    children: [
                      // Back button
                      Positioned(
                        left: 16,
                        top: 16,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFA838),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      // Plated logo - larger and without white background
                      Center(
                        child: SizedBox(
                          width: 160, // Increased from 100
                          height: 160, // Increased from 100
                          child: Image.asset(
                            "assets/images/plated_logo.png",
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback custom logo if asset fails to load - also larger
                              return Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Fork on the left
                                    SizedBox(
                                      width: 30, // Scaled up from 22
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Fork tines
                                          SizedBox(
                                            width: 20, // Scaled up from 14
                                            height: 28, // Scaled up from 20
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width:
                                                        3, // Scaled up from 2
                                                    height:
                                                        25, // Scaled up from 18
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFA838),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.5),
                                                    )),
                                                Container(
                                                    width: 3,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFA838),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.5),
                                                    )),
                                                Container(
                                                    width: 3,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFA838),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.5),
                                                    )),
                                                Container(
                                                    width: 3,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFA838),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.5),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          // Fork handle
                                          Container(
                                            width: 6, // Scaled up from 4
                                            height: 63, // Scaled up from 45
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFA838),
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                        width: 8), // Scaled up from 6

                                    // Plate in the center
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 45, // Scaled up from 32
                                          height: 45, // Scaled up from 32
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFFFFA838),
                                              width: 3.5, // Scaled up from 2.5
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 6), // Scaled up from 4
                                        const Text(
                                          'plated',
                                          style: TextStyle(
                                            color: Color(0xFFFFA838),
                                            fontSize: 17, // Scaled up from 12
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.5,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                        width: 8), // Scaled up from 6

                                    // Knife on the right
                                    SizedBox(
                                      width: 30, // Scaled up from 22
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Knife blade
                                          Container(
                                            width: 7, // Scaled up from 5
                                            height: 35, // Scaled up from 25
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFFFA838),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3.5),
                                                topRight: Radius.circular(3.5),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                              height: 3), // Scaled up from 2
                                          // Knife handle
                                          Container(
                                            width: 10, // Scaled up from 7
                                            height: 56, // Scaled up from 40
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFA838),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Form section
              Container(
                width: screenWidth,
                constraints: BoxConstraints(
                  minHeight:
                      screenHeight * 0.75, // At least 75% of screen height
                ),
                decoration: const ShapeDecoration(
                  color: Color(0xFFFAF1DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08, // 8% padding on each side
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Decorative dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF0F5F11),
                              shape: OvalBorder(),
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF0F5F11),
                              shape: OvalBorder(),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Title
                      const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Divider under title
                      Container(
                        width: screenWidth * 0.6,
                        height: 1,
                        color: const Color(0xFF7D7B7B),
                      ),

                      const SizedBox(height: 32),

                      // Username field
                      _buildInputField(
                        label: 'Username',
                        controller: _usernameController,
                        placeholder: 'Enter Username',
                      ),

                      const SizedBox(height: 24),

                      // Password field
                      _buildInputField(
                        label: 'Password',
                        controller: _passwordController,
                        placeholder: 'Enter Password',
                        isPassword: true,
                      ),

                      const SizedBox(height: 24),

                      // Confirm Password field
                      _buildInputField(
                        label: 'Confirm Password',
                        controller: _confirmPasswordController,
                        placeholder: 'Enter Password',
                        isPassword: true,
                      ),

                      const SizedBox(height: 40),

                      // Sign up with section
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFF7D7B7B),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFF7D7B7B),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Get Started button
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF7C55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(28),
                            onTap: () {
                              // Handle sign up logic here
                              _handleSignUp();
                            },
                            child: const Center(
                              child: Text(
                                'Get Started!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1.5,
                color: Color(0xFFD0D0D0),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: const TextStyle(
              color: Color(0xFF2C2C2C), // Dark grey text for better readability
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleSignUp() {
    // Validate inputs
    if (_usernameController.text.isEmpty) {
      _showSnackBar('Please enter a username');
      return;
    }

    if (_passwordController.text.isEmpty) {
      _showSnackBar('Please enter a password');
      return;
    }

    if (_confirmPasswordController.text.isEmpty) {
      _showSnackBar('Please confirm your password');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnackBar('Passwords do not match');
      return;
    }

    // TODO: Implement actual sign up logic
    _showSnackBar('Sign up successful!');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFFF7C55),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
