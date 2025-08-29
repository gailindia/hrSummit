import 'package:flutter/material.dart';
import 'package:hrsummit/utils/app_constants.dart'; 
class HeaderWidget extends StatelessWidget {
 

  const HeaderWidget({
    super.key 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(kIconLogo, height: 60, width: 90, fit: BoxFit.contain),
          Image.asset(khrimgLogo, height: 75, width: 70, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
