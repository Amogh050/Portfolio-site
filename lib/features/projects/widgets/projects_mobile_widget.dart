import 'package:flutter/material.dart';

class ProjectsMobileWidget extends StatelessWidget {
  const ProjectsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Projects',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Preah',
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildProjectCard(
                    'Portfolio Website',
                    'A responsive portfolio website built with Flutter',
                    Icons.web,
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'E-Commerce App',
                    'Full-stack e-commerce application with Flutter and Firebase',
                    Icons.shopping_cart,
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'Task Manager',
                    'A productivity app for managing daily tasks',
                    Icons.task_alt,
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'Weather App',
                    'Real-time weather information application',
                    Icons.cloud,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 36,
            color: Colors.white,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Preah',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontFamily: 'Preah',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View Project',
                  style: TextStyle(
                    color: Colors.purple,
                    fontFamily: 'Preah',
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 