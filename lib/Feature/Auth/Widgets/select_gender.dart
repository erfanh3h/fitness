// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SelectGenderBox extends StatelessWidget {
//   const SelectGenderBox({
//     Key? key,
//     required this.currentIndex,
//     required this.boxIndex,
//     required this.title,
//     required this.changeFunction,
//   }) : super(key: key);
//   final int currentIndex;
//   final int boxIndex;
//   final String title;
//   final VoidCallback changeFunction;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: changeFunction,
//       child: Container(
//         padding: EdgeInsets.all(5.r),
//         decoration: BoxDecoration(
//           color: currentIndex == boxIndex ? Colors.white : Colors.transparent,
//           border: Border.all(
//             color: Colors.white,
//             width: 0.3,
//           ),
//           borderRadius: BorderRadius.circular(3),
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//               color: currentIndex == boxIndex ? Colors.black : Colors.white,
//               fontSize: 9.r,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
