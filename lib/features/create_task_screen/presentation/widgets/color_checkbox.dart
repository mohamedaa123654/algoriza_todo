import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/util/color_manager.dart';
import 'package:todo_algoriza/features/create_task_screen/presentation/cubit/task_screen_cubit.dart';

class ColorCheckbox extends StatelessWidget {
  Function onChange;
  Color color;
  bool isChecked;

  ColorCheckbox({
    Key? key,
    required this.onChange,
    required this.color,
    required this.isChecked,
  }) : super(key: key);
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange();
      },
      child: AnimatedContainer(
        height: 28,
        width: 28,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: isChecked
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )
            : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: color,
        ),
      ),
    );
  }

  // Border selectedBoxBorder(Color Color, double width) =>
  //     Border.all(color: color, width: width);
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
