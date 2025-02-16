import 'package:flutter/material.dart';
class HoverableContainer extends StatefulWidget {
  final int index;

  HoverableContainer({required this.index});

  @override
  _HoverableContainerState createState() => _HoverableContainerState();
}

class _HoverableContainerState extends State<HoverableContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 200,
        height: 200,
        transform: isHovered
            ? (Matrix4.identity()
          ..scale(1.1)
          ..rotateZ(0.05)) // Scale and rotate on hover
            : Matrix4.identity(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isHovered
                ? [Colors.purple, Colors.blueAccent] // Gradient on hover
                : [Colors.blueAccent.withOpacity(0.8), Colors.blueAccent.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.4 : 0.2), // Darker shadow on hover
              blurRadius: isHovered ? 12 : 8,
              spreadRadius: isHovered ? 4 : 2,
            ),
          ],
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: isHovered ? 1.0 : 0.8, // Fade in text on hover
            child: AnimatedScale(
              duration: Duration(milliseconds: 300),
              scale: isHovered ? 1.2 : 1.0, // Scale up text on hover
              child: Text(
                'Project ${widget.index + 1}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}