import 'package:flutter/material.dart';
import 'widgets/techstack_desktop_widget.dart';
import 'widgets/techstack_mobile_widget.dart';

class TechstackScreen extends StatelessWidget {
  const TechstackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const TechstackDesktopWidget();
        } else {
          return const TechstackMobileWidget();
        }
      },
    );
  }
} 