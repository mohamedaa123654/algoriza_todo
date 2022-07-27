import 'package:flutter/material.dart';

class Custom_Checkbox extends StatelessWidget {
  double? size;
  double? iconSize;
  Function onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;

  Custom_Checkbox({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // isChecked = !isChecked;
        onChange();
      },
      child: AnimatedContainer(
          height: size ?? 28,
          width: size ?? 28,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: isChecked
                  ? backgroundColor ?? Colors.blue
                  : Colors.transparent,
              border: Border.all(color: borderColor ?? Colors.black)),
          child: isChecked
              ? Icon(
                  icon ?? Icons.check,
                  color: iconColor ?? Colors.white,
                  size: iconSize ?? 20,
                )
              : null),
    );
  }
} 




// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:todo_algoriza/features/home/presentation/cubit/home_cubit.dart';

// class Custom_Checkbox extends StatelessWidget {
//   double? size;
//   double? iconSize;
//   Function onChange;
//   Color? backgroundColor;
//   Color? iconColor;
//   Color? borderColor;
//   IconData? icon;
//   bool isChecked;
//   String status;
//   int id;

//   Custom_Checkbox({
//     Key? key,
//     this.size,
//     required this.id,
//     required this.status,
//     this.iconSize,
//     required this.onChange,
//     this.backgroundColor,
//     this.iconColor,
//     this.icon,
//     this.borderColor,
//     required this.isChecked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         HomeCubit.get(context).changeTaskState(status: status, id: id);
//       },
//       child: AnimatedContainer(
//           height: size ?? 28,
//           width: size ?? 28,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.fastLinearToSlowEaseIn,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(2.0),
//               color: isChecked
//                   ? backgroundColor ?? Colors.blue
//                   : Colors.transparent,
//               border: Border.all(color: borderColor ?? Colors.black)),
//           child: isChecked
//               ? Icon(
//                   icon ?? Icons.check,
//                   color: iconColor ?? Colors.white,
//                   size: iconSize ?? 20,
//                 )
//               : null),
//     );
//   }
// }
