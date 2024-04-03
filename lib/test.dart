// import 'package:flutter/material.dart';

// class Screen1 extends StatefulWidget {
//   Screen1({Key? key}) : super(key: key);
//   @override
//   _Screen1 createState() => _Screen1();
// }

// class _Screen1 extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (BuildContext context) {
//                     return Screen2();
//                   },
//                 ),
//               );
//             },
//             child: Text("go to second screen"),
//           ),
//         ),
//       );
//   }
// }

// class Screen2 extends StatefulWidget {
//   Screen2({Key? key}) : super(key: key);

//   @override
//   _Screen2 createState() => _Screen2();
// }

// class _Screen2 extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("go to the first screen"),
//           ),
//         ),
//       );
//   }
// }

// // class FirstRoute extends StatelessWidget {
// //   const FirstRoute({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('First Route'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           child: const Text('Open route'),
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => const SecondRoute()),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SecondRoute extends StatelessWidget {
// //   const SecondRoute({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Second Route'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           child: const Text('Go back!'),
// //         ),
// //       ),
// //     );
// //   }
// // }
