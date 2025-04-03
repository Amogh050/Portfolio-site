import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectCard extends StatefulWidget {
  final List<String> imagePaths;
  final String title;
  final String description;
  final String githubUrl;

  const ProjectCard({
    super.key,
    required this.imagePaths,
    required this.title,
    required this.description,
    required this.githubUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFF1E293B),
          border: Border.all(
            color: _isHovered ? Colors.blue.withOpacity(0.5) : Colors.transparent,
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 0,
                  )
                ]
              : [],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Collage
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: _buildCollage(),
              ),
            ),
            // Content
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // GitHub Link
                        InkWell(
                          onTap: _launchGithubUrl,
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.1),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              'assets/icons/github.svg',
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Description
                    Expanded(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13,
                          height: 1.4,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
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

  Widget _buildCollage() {
    if (widget.imagePaths.isEmpty) {
      return Container(color: const Color(0xFF0F172A));
    }
    
    if (widget.imagePaths.length == 1) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          widget.imagePaths[0],
          fit: BoxFit.contain,
        ),
      );
    }
    
    if (widget.imagePaths.length == 2) {
      return Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                widget.imagePaths[0],
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                widget.imagePaths[1],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      );
    }
    
    // For 3 or 4 images
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 6, top: 12, bottom: 6),
                  child: Image.asset(
                    widget.imagePaths[0],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 12, top: 12, bottom: 6),
                  child: Image.asset(
                    widget.imagePaths[1],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 6, top: 6, bottom: 12),
                  child: Image.asset(
                    widget.imagePaths.length > 2 ? widget.imagePaths[2] : widget.imagePaths[0],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, right: 12, top: 6, bottom: 12),
                  child: Image.asset(
                    widget.imagePaths.length > 3 ? widget.imagePaths[3] : widget.imagePaths[1],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _launchGithubUrl() async {
    final Uri url = Uri.parse(widget.githubUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
} 