import 'package:flutter/material.dart';

class TypingAnimationWidget extends StatefulWidget {
  final double fontSize;
  final Color textColor;
  final bool isMobile;
  final bool useGradient;

  const TypingAnimationWidget({
    super.key,
    required this.fontSize,
    required this.textColor,
    this.isMobile = false,
    this.useGradient = false,
  });

  @override
  State<TypingAnimationWidget> createState() => _TypingAnimationWidgetState();
}

class _TypingAnimationWidgetState extends State<TypingAnimationWidget> {
  String _currentText = '';
  String _fullText = '';
  int _currentIndex = 0;
  bool _isDeleting = false;
  bool _isWaiting = false;
  int _currentRoleIndex = 0;
  final List<String> _roles = [
    'Flutter Developer',
    'Backend Developer',
    'DSA Enthusiast',
  ];

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _fullText = _roles[_currentRoleIndex];
    _currentIndex = 0;
    _isDeleting = false;
    _isWaiting = false;
    _typeText();
  }

  void _typeText() {
    if (_isDeleting) {
      if (_currentIndex > 0) {
        setState(() {
          _currentIndex--;
          _currentText = _fullText.substring(0, _currentIndex);
        });
        Future.delayed(const Duration(milliseconds: 50), _typeText);
      } else {
        _currentRoleIndex = (_currentRoleIndex + 1) % _roles.length;
        _startTyping();
      }
    } else if (_isWaiting) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isDeleting = true;
        });
        _typeText();
      });
    } else {
      if (_currentIndex < _fullText.length) {
        setState(() {
          _currentIndex++;
          _currentText = _fullText.substring(0, _currentIndex);
        });
        Future.delayed(const Duration(milliseconds: 100), _typeText);
      } else {
        setState(() {
          _isWaiting = true;
        });
        _typeText();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      _currentText,
      style: TextStyle(
        fontFamily: 'Ethnocentric',
        color: widget.textColor,
        fontSize: widget.fontSize,
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            color: Colors.purple.withOpacity(0.4),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      textAlign: widget.isMobile ? TextAlign.center : TextAlign.left,
    );

    if (widget.useGradient) {
      return ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFB275F4), // Light purple
              Color(0xFF7B1FA2), // Deep purple
            ],
            stops: [0.0, 0.4, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        child: textWidget,
      );
    } else {
      return textWidget;
    }
  }
} 