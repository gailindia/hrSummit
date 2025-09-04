import 'package:flutter/material.dart';
import 'package:hrsummit/utils/app_constants.dart';

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
  final String onViewMore;

  const ProfileContentWidget({
    super.key,
    required this.name,
    required this.designation,
    required this.imagePath,
    required this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              baseImg + imagePath,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 35,
                );
              },
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
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),

          // View More bottom aligned
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => viewMoreDialog(context, name, designation,  baseImg + imagePath, onViewMore),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,

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
          ),
        ],
      ),
    );
  }
}
// void viewMoreDialog(
//   BuildContext context,
//   String content 
// ) {
//   showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (_) {
//       return Center(
//         child: Material(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white, 
//           child: Container( 
//             margin: EdgeInsets.all(20),
//             padding: EdgeInsets.symmetric(vertical: 10),
//             // child: Text("44",textAlign: TextAlign.center,)
//             child: Text(
//               content,
//               textAlign: TextAlign.center, 
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
void viewMoreDialog(
  BuildContext context,
  String name,
  String designation,
  String imagePath,
  String content,
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

         ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
               imagePath,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 35,
                );
              },
            ),
          ),
              const SizedBox(height: 12),

              // Name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Designation
              Text(
                designation,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),
              const Divider(),

              // Scrollable content
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14, height: 1.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

