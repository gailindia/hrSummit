import 'package:flutter/material.dart';
import 'package:hrsummit/constants/app_constants.dart';
import 'package:hrsummit/utils/colors.dart';
import 'package:hrsummit/widgets/styles/mytextStyle.dart'; 

class HeaderWidget extends StatelessWidget {
  final bool isIconVisible;
  final VoidCallback onMenuTap;
  final VoidCallback onProfileTap;

  const HeaderWidget({
    super.key,
    required this.onMenuTap,
    required this.onProfileTap,
    this.isIconVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    
      child: Column(
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (isIconVisible)
                  ? GestureDetector(
                      onTap: onMenuTap,
                      child: const Icon(Icons.menu, size: 28),  
                    )
                  : const SizedBox.shrink(),
           
              Image.asset(
                kIconLogo,
                height: 54,
                width: 80,
                fit: BoxFit.contain,
              ),
          
               
              (isIconVisible)
                  ? GestureDetector(
                      onTap: onProfileTap,
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage(userimg),  
                        backgroundColor: Colors.grey,
                      ),
                    )
                  : const SizedBox.shrink(), 
            ],
          ),
           const SizedBox(height: 10),
          Text("Learning and Development (L&D)",style: MyStyle.medium5(Mytheme.orng).s18,)
        ],
      ),
    );
  }
}
