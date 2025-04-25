import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_dev_quiz_1/ui/screens/item_page.dart';

void main() {
  group('AirPodsScreen Golden Test', () {
    goldenTest(
      'renders AirPodsScreen on iPhone 16 Pro Max',
      fileName: 'ui_sc_test', 
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(
          maxWidth: 430, 
          maxHeight: 932, 
        ),
        children: [
          GoldenTestScenario(
            name: 'AirPods UI - iPhone 16 Pro Max',
            child: MaterialApp(
              home: AirPodsScreen(),
              debugShowCheckedModeBanner: false,
            ),
          ),
        ],
      ),
    );
  });
}