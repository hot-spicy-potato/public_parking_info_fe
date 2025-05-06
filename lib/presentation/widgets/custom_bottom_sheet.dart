import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';

Future<void> showCustomBottomSheet(
  BuildContext context, {
  required Color barrierColor,
  required Widget child,
}) async {
  showModalBottomSheet(
    context: context,
    barrierColor: barrierColor,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (context) => CustomBottomSheet(child: child),
  );
}

class CustomBottomSheet extends ConsumerWidget {
  final Widget child;
  const CustomBottomSheet({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: CustomColors.dialogBar,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
// class CustomBottomSheet extends ConsumerWidget {
//   final Widget child;
//   const CustomBottomSheet({required this.child, super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             offset: Offset(0, -2),
//             blurRadius: 6,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 50,
//             height: 4,
//             margin: const EdgeInsets.only(bottom: 20),
//             decoration: BoxDecoration(
//               color: CustomColors.dialogBar,
//               borderRadius: BorderRadius.circular(50),
//             ),
//           ),
//           Expanded(child: SafeArea(child: child)),
//         ],
//       ),
//     );
//   }
// }
