import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController =
      TextEditingController(text: 'John Doe');
  final TextEditingController _usernameController =
      TextEditingController(text: '@johndoe');
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();

  String selectedDietaryRequirement = 'None';
  List<String> dietaryOptions = [
    'None',
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Kosher',
    'Halal',
    'Dairy-Free',
    'Nut-Free'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _nameFocus.dispose();
    _usernameFocus.dispose();
    super.dispose();
  }

  void _showDietaryRequirementsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF202020),
          title: Text(
            'Select Dietary Requirements',
            style: TextStyle(color: Colors.white),
          ),
          content: SizedBox(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dietaryOptions.length,
              itemBuilder: (context, index) {
                return RadioListTile<String>(
                  title: Text(
                    dietaryOptions[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  value: dietaryOptions[index],
                  groupValue: selectedDietaryRequirement,
                  activeColor: const Color(0xFFFFA838),
                  onChanged: (String? value) {
                    setState(() {
                      selectedDietaryRequirement = value!;
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF202020),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Change Profile Picture',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageOption(Icons.camera_alt, 'Camera'),
                  _buildImageOption(Icons.photo_library, 'Gallery'),
                  _buildImageOption(Icons.delete, 'Remove'),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageOption(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        // Here you would implement actual image picking functionality
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label option selected'),
            backgroundColor: const Color(0xFFFFA838),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFFFA838),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA838),
      body: Column(
        children: [
          // Header section
          SizedBox(
            height: 140,
            child: Stack(
              children: [
                // Back button
                Positioned(
                  left: 16,
                  top: 45,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFA838),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                // Settings title with gear icon
                Positioned(
                  left: 30,
                  top: 90,
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 26,
                      ),
                      SizedBox(width: 10),
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
              ],
            ),
          ),
          // Main content
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFF202020),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    // Edit Profile title
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Profile picture with edit button
                    Stack(
                      children: [
                        Container(
                          width: 168,
                          height: 168,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC4C4C4),
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF24265F),
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white70,
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: GestureDetector(
                            onTap: _showImagePickerOptions,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFA838),
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    // Name field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 39),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.72,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: _nameFocus.hasFocus
                                      ? const Color(0xFFFFA838)
                                      : const Color(0xFF282626),
                                ),
                                borderRadius: BorderRadius.circular(12.76),
                              ),
                            ),
                            child: TextFormField(
                              controller: _nameController,
                              focusNode: _nameFocus,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Inter',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.46,
                                  vertical: 12,
                                ),
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF8B8B8B),
                                  fontSize: 12,
                                ),
                              ),
                              onChanged: (value) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Username field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 39),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.72,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: _usernameFocus.hasFocus
                                      ? const Color(0xFFFFA838)
                                      : const Color(0xFF282626),
                                ),
                                borderRadius: BorderRadius.circular(12.76),
                              ),
                            ),
                            child: TextFormField(
                              controller: _usernameController,
                              focusNode: _usernameFocus,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Inter',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.46,
                                  vertical: 12,
                                ),
                                hintText: 'Enter your username',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF8B8B8B),
                                  fontSize: 12,
                                ),
                              ),
                              onChanged: (value) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    // Dietary Requirements
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 39),
                      child: GestureDetector(
                        onTap: _showDietaryRequirementsDialog,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dietary Requirements',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    selectedDietaryRequirement,
                                    style: TextStyle(
                                      color: const Color(0xFFFFA838),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: const Color(0xFFADADAD),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    // Save Changes Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 39),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Save functionality
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Profile updated successfully!'),
                                backgroundColor: const Color(0xFFFFA838),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFA838),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                          ),
                          child: Text(
                            'Save Changes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
