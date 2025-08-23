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
        scaffoldBackgroundColor: const Color(0xFF2F2F2E),
      ),
      home: const PreferencesPageNew(),
    );
  }
}

class PreferencesPageNew extends StatefulWidget {
  const PreferencesPageNew({super.key});

  @override
  State<PreferencesPageNew> createState() => _PreferencesPageNewState();
}

class _PreferencesPageNewState extends State<PreferencesPageNew> {
  final Set<String> selectedCuisines = {};
  final Set<String> selectedEquipment = {};
  final Set<String> selectedDietary = {};

  void toggleSelection(String item, Set<String> selectedSet) {
    setState(() {
      if (selectedSet.contains(item)) {
        selectedSet.remove(item);
      } else {
        selectedSet.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xFF2F2F2E),
        body: Stack(children: [
          // Orange solid background circle
          Positioned(
            left: size.width * 0.05,
            bottom: -size.height * 0.2,
            child: Opacity(
              opacity: 0.8,
              child: Container(
                width: size.width * 1.35,
                height: size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF9720),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          // Food basket image
          Positioned(
            right: -size.width * 0.09,
            bottom: -size.height * 0.08,
            child: Opacity(
              opacity: 0.5,
              child: SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.35,
                child: Image.asset(
                  'assets/images/preference_splash.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        constraints.maxHeight - 40, // Account for padding
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Title
                        const Text(
                          'Select your preferences:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Cuisine Section
                        const Text(
                          'Cuisine',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            'Italian',
                            'American',
                            'Indian',
                            'Chinese',
                            'Thai',
                            'Japanese',
                            'Lebanese',
                            'British',
                            'African',
                            'French',
                            'Spanish'
                          ]
                              .map((cuisine) => ChipWidget(
                                    label: cuisine,
                                    isSelected:
                                        selectedCuisines.contains(cuisine),
                                    onTap: () => toggleSelection(
                                        cuisine, selectedCuisines),
                                  ))
                              .toList(),
                        ),

                        const SizedBox(height: 40),

                        // Equipment Section
                        const Text(
                          'Equipment Available',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            'Oven',
                            'Air fryer',
                            'Freezer',
                            'Blender',
                            'Stove',
                            'Kettle'
                          ]
                              .map((equipment) => ChipWidget(
                                    label: equipment,
                                    isSelected:
                                        selectedEquipment.contains(equipment),
                                    onTap: () => toggleSelection(
                                        equipment, selectedEquipment),
                                  ))
                              .toList(),
                        ),

                        const SizedBox(height: 40),

                        // Dietary Requirements Section
                        const Text(
                          'Dietary Requirements',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            'Vegan',
                            'Vegetarian',
                            'Gluten-Free',
                            'Halal',
                            'Kosher',
                            'Nut-free'
                          ]
                              .map((dietary) => ChipWidget(
                                    label: dietary,
                                    isSelected:
                                        selectedDietary.contains(dietary),
                                    onTap: () => toggleSelection(
                                        dietary, selectedDietary),
                                  ))
                              .toList(),
                        ),

                        const SizedBox(height: 80),

                        // Plate button
                        Container(
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF7C55),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                // Access selected preferences:
                                // selectedCuisines, selectedEquipment, selectedDietary
                                // print('Selected cuisines: $selectedCuisines');
                                // print('Selected equipment: $selectedEquipment');
                                // print('Selected dietary: $selectedDietary');
                              },
                              child: const Center(
                                child: Text(
                                  'Plate!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 200), // Extra space for image
                      ],
                    ),
                  ),
                ),
              );
            },
          ))
        ]));
  }
}

class ChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF9720) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
