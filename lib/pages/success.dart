// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tourism/pages/home.dart';
// import 'package:tourism/widget/customscaffold.dart';

// class Success extends StatelessWidget {
//  static String id = "success";
//   const Success({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(

//       imagePath: "lib/images/Android Small - 1.png",
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           const  Icon(
//               Icons.check_circle_outline,
//               size: 100,
//               color: Color.fromARGB(255, 81, 126, 163),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                             Navigator.pushReplacementNamed(
//                                 context, Homepage.id);
//                           },
//               child: Text(
//                 'Done Successfully',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0XFF1B4158),
//                 ),
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/widget/customscaffold.dart';

class Success extends StatelessWidget {
  static String id = "success";
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Color.fromARGB(255, 81, 126, 163),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, Homepage.id);
              },
              child: Text(
                'Done Successfully',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF1B4158),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
