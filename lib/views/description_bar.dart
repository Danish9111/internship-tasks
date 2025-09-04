// import 'package:flutter/material.dart';
// import 'package:legal_vehicle_recovery_managment_app/config/app_colors.dart';

// class DescriptionBar extends StatelessWidget {
//   final String? text1;
//   final String? text2;
//   final String? text3;
//   final String? text4;
//   const DescriptionBar({
//     super.key,
//     this.text1,
//     this.text2,
//     this.text3,
//     this.text4,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//         decoration: BoxDecoration(
//           color: AppColors.primary.withOpacity(0.8),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 textAlign: TextAlign.center,
//                 text1 ?? '',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 textAlign: TextAlign.center,

//                 text2 ?? '',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 textAlign: TextAlign.center,
//                 text3 ?? '',

//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
