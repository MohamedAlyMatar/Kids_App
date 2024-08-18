// import 'package:flutter/material.dart';

// class ImgChoice extends StatelessWidget {
//   const ImgChoice({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => selectPicture(0),
//       child: Container(
//         padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: isAnswerSubmitted
//               ? (correctAnswers.contains(0)
//                   ? Colors.green
//                   : selectedPictureIndices.contains(0)
//                       ? Colors.red
//                       : Colors.grey)
//               : selectedPictureIndices.contains(0)
//                   ? Colors.blue
//                   : Colors.grey,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Image.asset(ImgAssets.brain, width: 100),
//       ),
//     );
//   }
// }
