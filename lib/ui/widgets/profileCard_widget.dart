import 'package:flutter/material.dart';

class BackgroundCardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const BackgroundCardWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFFF1ECF9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
class ProfileContentWidget extends StatelessWidget {
  final String name;
  final String designation;
  final String imagePath;
  final VoidCallback onViewMore;

  const ProfileContentWidget({
    super.key,
    required this.name,
    required this.designation,
    required this.imagePath,
    required this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 12),

        // Name + Designation
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                designation,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        // View More button
        GestureDetector(
          onTap: onViewMore,
          child: Row(
            children: const [
              Text(
                "View More",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_right_alt, color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }
}
 
