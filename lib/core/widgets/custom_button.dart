import 'package:flutter/material.dart';
import 'package:sign_in_page/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double borderRadius;
  final double elevation;
  final double height;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius = 12,
    this.elevation = 4,
    this.height = 52,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? Colors.green[600];
    final style =
        textStyle ??
        Styles.textStyle18.copyWith(color: Colors.white, letterSpacing: 0.5);
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
          shadowColor: const Color.fromARGB(
            179,
            73,
            204,
            141,
          ).withValues(alpha: 0.4),
        ),
        onPressed: onPressed,
        child: Text(text, style: style),
      ),
    );
  }
}
