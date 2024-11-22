// import 'package:flutter/material.dart';
//
// class ButtonInRow extends StatelessWidget {
//   final Color primaryColor;
//   final VoidCallback onPressed;
//   final String buttonText;
//
//   ButtonInRow({
//     required this.primaryColor,
//     required this.onPressed,
//     required this.buttonText,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double maxFontSize = 20.0;
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
//         backgroundColor: primaryColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//       ),
//       onPressed: onPressed,
//       child: Text(
//           buttonText,
//           style: TextStyle(color: Colors.white),
//           overflow: TextOverflow.ellipsis
//       ),
//     );
//   }
// }
