import 'dart:math';
import 'package:flutter/material.dart';

class CircuitBoardBackground extends StatefulWidget {
  final Widget child;
  final Color lineColor;
  final Color nodeColor;
  
  const CircuitBoardBackground({
    super.key, 
    required this.child,
    this.lineColor = const Color(0xFF075985),
    this.nodeColor = const Color(0xFF0EA5E9),
  });

  @override
  State<CircuitBoardBackground> createState() => _CircuitBoardBackgroundState();
}

class _CircuitBoardBackgroundState extends State<CircuitBoardBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random random = Random();
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 15000),
    )..repeat();
    
    // Create particles
    _initializeParticles();
  }
  
  void _initializeParticles() {
    _particles.clear();
    for (int i = 0; i < 80; i++) {
      _particles.add(Particle(random));
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background color
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF050510), // Darker blue-black
                Color(0xFF07101E), // Darker blue
                Color(0xFF020E21), // Deeper navy
              ],
            ),
          ),
        ),
        
        // Circuit board particle effect
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
              painter: CircuitPainter(
                particles: _particles,
                lineColor: widget.lineColor,
                nodeColor: widget.nodeColor,
              ),
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
            );
          },
        ),
        
        // Content
        widget.child,
      ],
    );
  }
}

class Particle {
  late double x;
  late double y;
  late double speed;
  late double size;
  late double directionX;
  late double directionY;
  
  Particle(Random random) {
    x = random.nextDouble() * 100; // Percentage position
    y = random.nextDouble() * 100;
    speed = 0.05 + random.nextDouble() * 0.1;
    size = 1 + random.nextDouble() * 2;
    directionX = random.nextBool() ? speed : -speed;
    directionY = random.nextBool() ? speed : -speed;
  }
  
  void update() {
    x += directionX;
    y += directionY;
    
    // Bounce off walls
    if (x < 0 || x > 100) directionX *= -1;
    if (y < 0 || y > 100) directionY *= -1;
  }
}

class CircuitPainter extends CustomPainter {
  final List<Particle> particles;
  final Color lineColor;
  final Color nodeColor;
  final double connectionDistance = 15; // Connection distance in percentage
  
  CircuitPainter({
    required this.particles,
    required this.lineColor,
    required this.nodeColor,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = nodeColor
      ..strokeCap = StrokeCap.round;
    
    final linePaint = Paint()
      ..color = lineColor.withOpacity(0.15)
      ..strokeWidth = 0.4;
    
    // Update particles
    for (var particle in particles) {
      particle.update();
    }
    
    // Draw connections
    for (int i = 0; i < particles.length; i++) {
      final percentX = particles[i].x / 100;
      final percentY = particles[i].y / 100;
      final currentX = percentX * size.width;
      final currentY = percentY * size.height;
      
      for (int j = i + 1; j < particles.length; j++) {
        final otherPercentX = particles[j].x / 100;
        final otherPercentY = particles[j].y / 100;
        final otherX = otherPercentX * size.width;
        final otherY = otherPercentY * size.height;
        
        final distance = sqrt(
          pow(otherPercentX - percentX, 2) + 
          pow(otherPercentY - percentY, 2)
        );
        
        if (distance < connectionDistance / 100) {
          // Draw line
          canvas.drawLine(
            Offset(currentX, currentY),
            Offset(otherX, otherY),
            linePaint,
          );
        }
      }
      
      // Draw particle
      paint.color = nodeColor.withOpacity(0.4);
      canvas.drawCircle(
        Offset(currentX, currentY),
        particles[i].size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CircuitPainter oldDelegate) => true;
} 