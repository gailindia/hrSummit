import 'package:flutter/material.dart';
import 'package:hrsummit/utils/app_constants.dart';
import 'package:hrsummit/utils/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Mytheme.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.network(
          //   "${baseImg}Home/gail-logo.png",
          //   fit: BoxFit.cover,
          //   errorBuilder: (context, error, stackTrace) {
          //     return 
              Image.asset(
                kIconLogo,
                height: 50,
                width: 70,
                fit: BoxFit.contain,
            //   );
            // },
          ),
          // Image.network(
          //   "${baseImg}Home/hr-summit.png",
          //   fit: BoxFit.cover,
          //   errorBuilder: (context, error, stackTrace) {
          //     return 
              Image.asset(
                khrimgLogo,
                height: 60,
                width: 50,
                fit: BoxFit.contain,
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
