import 'package:flutter/material.dart';
import 'widgets/projects_desktop_widget.dart';
import 'widgets/projects_mobile_widget.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const ProjectsDesktopWidget();
        } else {
          return const ProjectsMobileWidget();
        }
      },
    );
  }
} 