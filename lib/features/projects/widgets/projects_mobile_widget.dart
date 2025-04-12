import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project_card.dart';

class ProjectsMobileWidget extends StatelessWidget {
  const ProjectsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calculate width based on screen size but cap at 450px max width
    final cardWidth = screenWidth <= 600 
                    ? screenWidth * 0.9 
                    : screenWidth <= 800 
                      ? screenWidth * 0.7 
                      : 450.0;
    
    return Column(
      children: [
        Center(
          child: Text(
            'Projects',
            style: GoogleFonts.dmSerifText(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: cardWidth,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(
                height: 288,
                child: ProjectCard(
                  imagePaths: [
                    'assets/projects/user1.png',
                    'assets/projects/user2.png',
                  ],
                  title: 'FlutterAmazon',
                  description: 'FlutterAmazon is a full-featured Amazon clone built with Flutter for the frontend and Node.js/Express with MongoDB for the backend. Deployed using Render, this project offers a robust e-commerce experience with role-based functionalities for both users and administrators.',
                  githubUrl: 'https://github.com/Amogh050/FlutterAmazon',
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 288,
                child: ProjectCard(
                  imagePaths: [
                    'assets/projects/scribble1.png',
                    'assets/projects/scribble3.png',
                  ],
                  title: 'Scribble',
                  description: 'Scribble is a fun and interactive multiplayer drawing and guessing game where players take turns drawing an assigned word while others try to guess it. Compete with friends in a fast-paced game that challenges your creativity and word-guessing skills!',
                  githubUrl: 'https://github.com/Amogh050/Scribble',
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 288,
                child: ProjectCard(
                  imagePaths: [
                    'assets/projects/news1.png',
                    'assets/projects/news2.png',
                  ],
                  title: 'FlutterNews',
                  description: 'FlutterNews is a Flutter application that fetches and displays news articles dynamically using an API. It features category-based filtering, location-based news, and a user-friendly UI. Additionally, it integrates Gemini AI to summarize news articles efficiently.',
                  githubUrl: 'https://github.com/Amogh050/FlutterNews',
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 288,
                child: ProjectCard(
                  imagePaths: [
                    'assets/projects/echo1.png',
                    'assets/projects/echo2.png',
                  ],
                  title: 'Echo AI',
                  description: 'Echo-AI is a simple Flutter project where you can interact with the app using your voice. The app listens to your commands and reads its responses aloud. It also supports generating images based on your input.',
                  githubUrl: 'https://github.com/Amogh050/Echo-AI',
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
} 