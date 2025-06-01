// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CustomSideBar extends ConsumerStatefulWidget {
//   const CustomSideBar({
//     required this.controller,
//     required this.animationDuration,
//     required this.width,
//     required this.
//     this.height = double.infinity,
//     super.key,
//   });

//   final AnimationController controller;
//   final Duration animationDuration;
//   final double width;
//   final double? height;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CustomSideBarState();
// }

// class _CustomSideBarState extends ConsumerState<CustomSideBar> {
//   @override
//   void initState() {
//     super.initState();
//     // animation 정의
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: widget.controller,
//       builder: (context, child) {
//         return AnimatedContainer(
//           duration: widget.animationDuration,
//           width: widget.width,
//           height: widget.height,
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: ,
//                   itemBuilder: (context, index) {
//                     //
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
