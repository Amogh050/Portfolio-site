import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../intro/widgets/typing_animation_widget.dart';

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
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // Planet image at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/welcome_image.png',
                height: isDesktop ? size.height * 0.6 : size.height * 0.4,
                fit: BoxFit.contain,
              ),
            ),
            
            // Text content positioned in upper portion
            Positioned(
              top: isDesktop ? size.height * 0.15 : size.height * 0.1,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100.0 : 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name with larger font and slight left positioning
                    Align(
                      alignment: const Alignment(-0.8, 0),
                      child: Text(
                        'Amogh Deshpande',
                        style: TextStyle(
                          fontFamily: 'Astro',
                          fontSize: isDesktop ? 90 : 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: isDesktop ? 20 : 15),
                    
                    // Typewriter animation with slight right positioning
                    Align(
                      alignment: const Alignment(0.6, 0),
                      child: TypingAnimationWidget(
                        fontSize: isDesktop ? 36 : 26,
                        textColor: Colors.purple,
                        isMobile: !isDesktop,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}