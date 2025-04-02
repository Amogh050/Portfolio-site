import 'package:flutter/material.dart';

class TechstackDesktopWidget extends StatelessWidget {
  const TechstackDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tech Stack',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Preah',
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                children: [
                  _buildTechCard('Flutter', Icons.flutter_dash),
                  _buildTechCard('Dart', Icons.code),
                  _buildTechCard('React', Icons.web),
                  _buildTechCard('Node.js', Icons.storage),
                  _buildTechCard('Python', Icons.terminal),
                  _buildTechCard('Firebase', Icons.cloud),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Preah',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
} 