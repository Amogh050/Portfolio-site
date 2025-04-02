import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../intro/widgets/intro_desktop_widget.dart';
import '../intro/widgets/intro_mobile_widget.dart';
import '../techstack/widgets/techstack_desktop_widget.dart';
import '../techstack/widgets/techstack_mobile_widget.dart';
import '../projects/widgets/projects_desktop_widget.dart';
import '../projects/widgets/projects_mobile_widget.dart';
import '../contact_us/widgets/contact_us_desktop_widget.dart';
import '../contact_us/widgets/contact_us_mobile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(4, (index) => GlobalKey());
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateCurrentSection);
  }

  void _updateCurrentSection() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final key = _sectionKeys[i];
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        if (position.dy <= 100) {
          setState(() {
            _currentSection = i;
          });
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      setState(() {
        _currentSection = index;
      });
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateCurrentSection);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0A0A1A),  // Darker blue-black
              const Color(0xFF0D1525),  // Darker blue
              const Color(0xFF0A1F3C),  // Darker purple-blue
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 600;
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Intro Section
                  Container(
                    key: _sectionKeys[0],
                    padding: EdgeInsets.only(
                      top: isDesktop ? 20.0 : 60.0,
                      left: isDesktop ? 100.0 : 20.0,
                      right: isDesktop ? 100.0 : 20.0,
                    ),
                    child: isDesktop 
                      ? const IntroDesktopWidget() 
                      : const IntroMobileWidget(),
                  ),
                  // Tech Stack Section
                  Container(
                    key: _sectionKeys[1],
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 100.0 : 20.0,
                      vertical: 30.0,
                    ),
                    child: isDesktop 
                      ? const TechstackDesktopWidget() 
                      : const TechstackMobileWidget(),
                  ),
                  // Projects Section
                  Container(
                    key: _sectionKeys[2],
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 100.0 : 20.0,
                      vertical: 50.0,
                    ),
                    child: isDesktop 
                      ? const ProjectsDesktopWidget() 
                      : const ProjectsMobileWidget(),
                  ),
                  // Contact Section
                  Container(
                    key: _sectionKeys[3],
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 100.0 : 20.0,
                      vertical: 50.0,
                    ),
                    child: isDesktop 
                      ? const ContactUsDesktopWidget() 
                      : const ContactUsMobileWidget(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 600;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    const Color(0xFF0A0A1A).withOpacity(0.98),
                    const Color(0xFF0D1525).withOpacity(0.98),
                    const Color(0xFF0A1F3C).withOpacity(0.98),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 100.0 : 20.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo or Name
                    Text(
                      'AMOGH DESHPANDE',
                      style: GoogleFonts.audiowide(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    // Navigation
                    if (isDesktop)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNavButton('Home', 0),
                          _buildNavButton('Tech Stack', 1),
                          _buildNavButton('Projects', 2),
                          _buildNavButton('Contact', 3),
                        ],
                      )
                    else
                      Theme(
                        data: Theme.of(context).copyWith(
                          popupMenuTheme: PopupMenuThemeData(
                            color: Colors.black.withOpacity(0.9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        child: PopupMenuButton<int>(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onSelected: _scrollToSection,
                          itemBuilder: (context) => [
                            _buildPopupMenuItem('Home', 0),
                            _buildPopupMenuItem('Tech Stack', 1),
                            _buildPopupMenuItem('Projects', 2),
                            _buildPopupMenuItem('Contact', 3),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(String text, int value) {
    return PopupMenuItem<int>(
      value: value,
      child: Text(
        text,
        style: TextStyle(
          color: _currentSection == value ? Colors.purple : Colors.white,
          fontSize: 16,
          fontFamily: 'Preah',
        ),
      ),
    );
  }

  Widget _buildNavButton(String text, int index) {
    final isSelected = _currentSection == index;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: () => _scrollToSection(index),
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? Colors.purple.withOpacity(0.2) : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.purple : Colors.transparent,
                width: 1,
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.purple : Colors.white,
                fontSize: 16,
                fontFamily: 'Preah',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
} 