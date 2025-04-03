import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'skills_grid.dart';
import '../models/skill.dart';

class SkillsMobileWidget extends StatelessWidget {
  static final List<Skill> skills = [
    Skill(iconPath: 'assets/icons/flutter.svg', label: 'Flutter'),
    Skill(iconPath: 'assets/icons/dart.svg', label: 'Dart'),
    Skill(iconPath: 'assets/icons/firebase.svg', label: 'Firebase'),
    Skill(iconPath: 'assets/icons/github.svg', label: 'GitHub'),
    Skill(iconPath: 'assets/icons/git.svg', label: 'Git'),
    Skill(iconPath: 'assets/icons/javascript.svg', label: 'JavaScript'),
    Skill(iconPath: 'assets/icons/nodejs.svg', label: 'Node.js'),
    Skill(iconPath: 'assets/icons/mongodb.svg', label: 'MongoDB'),
    Skill(iconPath: 'assets/icons/express.svg', label: 'Express'),
    Skill(iconPath: 'assets/icons/python.svg', label: 'Python'),
    Skill(iconPath: 'assets/icons/cpp.svg', label: 'C++'),
    Skill(iconPath: 'assets/icons/mysql.svg', label: 'MySQL'),
  ];

  const SkillsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Skills',
            style: GoogleFonts.dmSerifText(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SkillsGrid(
          isDesktop: false,
          skills: skills,
        ),
      ],
    );
  }
} 