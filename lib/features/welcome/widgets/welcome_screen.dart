import 'package:flutter/material.dart';
import '../../intro/widgets/typing_animation_widget.dart';
import 'dart:math';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../design/circuit_background.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1000;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        // Detect even the slightest scroll and navigate to next section
        if (notification.metrics.pixels > 0) {
          // Find the scrollable parent
          final scrollable = Scrollable.maybeOf(context);
          if (scrollable != null && scrollable.widget.controller != null) {
            // Scroll to the next section (height of the welcome screen)
            scrollable.widget.controller!.animateTo(
              size.height,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          }
          return true; // Stop notification bubbling
        }
        return false; // Allow notification to continue bubbling
      },
      child: SizedBox(
        height: isDesktop ? size.height : size.height * 0.9,
        width: size.width,
        child: Stack(
          children: [
            // 3D Model on right side for desktop
            if (isDesktop)
              Positioned(
                right: size.width * 0.02,
                top: size.height * 0.15,
                bottom: size.height * 0.05,
                width: size.width * 0.5,
                child: SizedBox(
                  width: size.width * 0.5,
                  height: size.height * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InteractiveElement(
                      child: const ModelViewer(
                        backgroundColor: Color.fromARGB(0, 0, 0, 0),
                        src: 'assets/3d_model/robot_playground.glb',
                        alt: '3D Model',
                        ar: false,
                        autoRotate: true,
                        cameraControls: true,
                        autoPlay: true,
                        disableZoom: true,
                        disableTap: false,
                        disablePan: false,
                        interactionPromptThreshold: 0,
                        maxCameraOrbit: "Infinity 90deg auto",
                        cameraOrbit: "-30deg 75deg auto",
                      ),
                    ),
                  ),
                ),
              ),

            // Mobile 3D model - positioned below welcome text for mobile
            if (!isDesktop)
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                height: size.height * 0.5,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: InteractiveElement(
                    child: const ModelViewer(
                      backgroundColor: Color.fromARGB(0, 0, 0, 0),
                      src: 'assets/3d_model/robot_playground.glb',
                      alt: '3D Model',
                      ar: false,
                      autoRotate: true,
                      cameraControls: true,
                      autoPlay: true,
                      disableZoom: true,
                      disableTap: false,
                      disablePan: false,
                      interactionPromptThreshold: 0,
                      maxCameraOrbit: "Infinity 90deg auto",
                      cameraOrbit: "-30deg 75deg auto",
                    ),
                  ),
                ),
              ),

            // Text content
            Positioned(
              top: isDesktop ? size.height * 0.4 : size.height * 0.1,
              left: max(size.width * 0.03, 15),
              width: isDesktop ? size.width * 0.47 : size.width * 0.88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name header - first line
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.15),
                          blurRadius: 20,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.white,
                            Color(0xFF00DDFF),
                            Color(0xFF0088FF),
                          ],
                          stops: [0.0, 0.4, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: Text(
                        'AMOGH',
                        style: TextStyle(
                          fontFamily: 'Astro',
                          fontSize: isDesktop 
                              ? size.width * 0.055
                              : size.width * 0.1,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          height: 0.9,
                          shadows: [
                            Shadow(
                              color: Colors.blue.withOpacity(0.4),
                              offset: const Offset(0, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: isDesktop ? 5 : 2),
                  
                  // Name header - second line
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.15),
                          blurRadius: 20,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.white,
                            Color(0xFF00DDFF),
                            Color(0xFF0088FF),
                          ],
                          stops: [0.0, 0.4, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: Text(
                        'DESHPANDE',
                        style: TextStyle(
                          fontFamily: 'Astro',
                          fontSize: isDesktop 
                              ? size.width * 0.055
                              : size.width * 0.1,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          height: 0.9,
                          shadows: [
                            Shadow(
                              color: Colors.blue.withOpacity(0.4),
                              offset: const Offset(0, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: isDesktop ? 30 : 20),

                  // Typing animation
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.1),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: TypingAnimationWidget(
                      fontSize: isDesktop ? 40 : 22,
                      textColor: Colors.white,
                      isMobile: !isDesktop,
                      useGradient: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
