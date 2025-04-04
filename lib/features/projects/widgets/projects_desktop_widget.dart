import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project_card.dart';

class ProjectsDesktopWidget extends StatelessWidget {
  const ProjectsDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Projects',
            style: GoogleFonts.dmSerifText(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.68,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.15,
              crossAxisSpacing: 60,
              mainAxisSpacing: 25,
              children: [
                ProjectCard(
                  imagePaths: [
                    'assets/projects/user1.png',
                    'assets/projects/user2.png',
                  ],
                  title: 'FlutterAmazon',
                  description: 'FlutterAmazon is a full-featured Amazon clone built with Flutter for the frontend and Node.js/Express with MongoDB for the backend. Deployed using Render, this project offers a robust e-commerce experience with role-based functionalities for both users and administrators.',
                  githubUrl: 'https://github.com/Amogh050/FlutterAmazon',
                ),
                ProjectCard(
                  imagePaths: [
                    'assets/projects/scribble1.png',
                    'assets/projects/scribble3.png',
                  ],
                  title: 'Scribble',
                  description: 'Scribble is a fun and interactive multiplayer drawing and guessing game where players take turns drawing an assigned word while others try to guess it. Compete with friends in a fast-paced game that challenges your creativity and word-guessing skills!',
                  githubUrl: 'https://github.com/Amogh050/Scribble',
                ),
                ProjectCard(
                  imagePaths: [
                    'assets/projects/news1.png',
                    'assets/projects/news2.png',
                  ],
                  title: 'FlutterNews',
                  description: 'FlutterNews is a Flutter application that fetches and displays news articles dynamically using an API. It features category-based filtering, location-based news, and a user-friendly UI. Additionally, it integrates Gemini AI to summarize news articles efficiently.',
                  githubUrl: 'https://github.com/Amogh050/FlutterNews',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
} 