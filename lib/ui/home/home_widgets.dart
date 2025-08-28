import 'package:flutter/material.dart';
import 'package:hrsummit/widgets/styles/mytextStyle.dart'; 

Widget buildDashboardCard({
    required String title,
    required String image, 
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              title,
              style: MyStyle.medium5().s16
            ),
          ),
          Image.asset(image, fit: BoxFit.contain, height: 85, width: 160),
        
        ],
      ),
    );
  }