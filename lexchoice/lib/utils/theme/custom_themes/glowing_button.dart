import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final VoidCallback? onPressed;
  final Widget child;

  const GlowingButton({
    Key? key,
    this.color1 = Colors.cyan,
    this.color2 = Colors.greenAccent,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  bool glowing = false;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
        widget.onPressed?.call();
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              widget.color1,
              widget.color2,
            ],
          ),
          // Reverse glow effect: show shadow when clicked
          boxShadow: !glowing
              ? []
              : [
                  BoxShadow(
                    color: widget.color1.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 16,
                    offset: const Offset(-8, 0),
                  ),
                  BoxShadow(
                    color: widget.color2.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 16,
                    offset: const Offset(8, 0),
                  ),
                  BoxShadow(
                    color: widget.color1.withOpacity(0.2),
                    spreadRadius: 16,
                    blurRadius: 32,
                    offset: const Offset(-8, 0),
                  ),
                  BoxShadow(
                    color: widget.color2.withOpacity(0.2),
                    spreadRadius: 16,
                    blurRadius: 32,
                    offset: const Offset(8, 0),
                  ),
                ],
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
