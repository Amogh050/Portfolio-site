import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'typing_animation_widget.dart';

class IntroMobileWidget extends StatelessWidget {
  const IntroMobileWidget({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.purple.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/self.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Text Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Hello everyone,',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "I'm Amogh Deshpande",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TypingAnimationWidget(
                      fontSize: 24,
                      textColor: Colors.purple,
                      isMobile: true,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "I'm a B.Tech Computer Science student at ABV IIITM Gwalior with a strong passion for software development. I specialize in Flutter for mobile app development and have experience in backend technologies like Node.js, Express, and MongoDB. My expertise extends to real-time systems, algorithmic problem-solving, and database management. I enjoy building efficient, scalable solutions and continuously exploring new technologies to enhance my skills.",
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL('https://github.com/Amogh050'),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/github.svg',
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.linkedin.com/in/amogh-deshpande-56a764289/'),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/linkedin.svg',
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    // return InkWell(
    //   onTap: () => html.window.open(link, '_blank'),
    //   // child: SocialWidget(
    //   //   placeholderText: '',
    //   //   iconData: iconPath,
    //   //   iconSize: 20,
    //   //   iconColor: Colors.white,
    //   //   link: link,
    //   // ),
    // );
    return SizedBox();
  }
}
