import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/core.dart';
import '../../widgets/widgets.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  double buttonPositionX = 90;
  double buttonPositionY = 220;
  late AnimationController controller;
  late ConfettiController _centerController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _centerController = ConfettiController(
      duration: const Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              AppAssests.backGround,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              top: 70,
              left: 80,
              child: Row(
                children: [
                  Text(
                    "Will You Marry me ???",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _centerController,
                blastDirection: pi / 2,
                maxBlastForce: 5,
                minBlastForce: 1,
                emissionFrequency: 0.03,
                numberOfParticles: 50,
                colors: const [
                  Colors.red,
                  Colors.pink,
                  Colors.orange,
                  Colors.yellow,
                ],
                gravity: 0.1,
              ),
            ),
            Positioned(
              top: 150,
              left: 90,
              child: CustomButton(
                onTap: () {
                  _centerController.play();
                },
                text: "Yes",
              ),
            ),
            Positioned(
              left: buttonPositionX,
              top: buttonPositionY,
              child: MouseRegion(
                onEnter: (_) {
                  moveButtonToRandomPosition();
                },
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return CustomButton(onTap: () {}, text: "No");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveButtonToRandomPosition() {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const buttonWidth = 100.0;
    const buttonHeight = 36.0;

    setState(() {
      buttonPositionX = random.nextDouble() * (screenWidth - buttonWidth / 3);
      buttonPositionY = random.nextDouble() * (screenHeight - buttonHeight);
      controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}



// import 'dart:math';

// import 'package:confetti/confetti.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';

// import '../../core/assets.dart';
// import '../../widgets/widgets.dart';

// class IndexPage extends StatefulWidget {
//   const IndexPage({super.key});

//   @override
//   State<IndexPage> createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage>
//     with SingleTickerProviderStateMixin {
//   double buttonPositionX = 90;
//   double buttonPositionY = 220;
//   late AnimationController controller;
//   late ConfettiController _centerController;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _centerController = ConfettiController(
//       duration: const Duration(seconds: 10),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: size.height,
//           width: size.width * .9,
//           child: Stack(
//             children: [
//               Image.asset(
//                 AppAssests.backGround,
//                 fit: BoxFit.fill,
//                 height: double.infinity,
//                 width: double.infinity,
//               ),
//               Positioned(
//                 top: 70,
//                 left: 80,
//                 child: Row(
//                   children: [
//                     Text(
//                       "Will You Marry me ???",
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 40,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Lottie.asset(AppAssests.love, height: 50),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: ConfettiWidget(
//                   confettiController: _centerController,
//                   blastDirection: pi / 2,
//                   maxBlastForce: 5,
//                   minBlastForce: 1,
//                   emissionFrequency: 0.03,
//                   numberOfParticles: 10,
//                   colors: const [
//                     Colors.yellow,
//                     Colors.amber,
//                   ],
//                   gravity: 0,
//                 ),
//               ),
//               Positioned(
//                 top: 150,
//                 left: 90,
//                 child: CustomButton(
//                   onTap: () {
//                     _centerController.play();
//                   },
//                   text: "Yes",
//                 ),
//               ),
//               Positioned(
//                 left: buttonPositionX,
//                 top: buttonPositionY,
//                 child: MouseRegion(
//                   onEnter: (_) {
//                     moveButtonToRandomPosition();
//                   },
//                   child: AnimatedBuilder(
//                     animation: controller,
//                     builder: (context, child) {
//                       return CustomButton(onTap: () {}, text: "No");
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void moveButtonToRandomPosition() {
//     final random = Random();
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     const buttonWidth = 100.0;
//     const buttonHeight = 36.0;

//     setState(() {
//       buttonPositionX = random.nextDouble() * (screenWidth - buttonWidth / 3);
//       buttonPositionY = random.nextDouble() * (screenHeight - buttonHeight);
//       controller.forward(from: 0);
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
