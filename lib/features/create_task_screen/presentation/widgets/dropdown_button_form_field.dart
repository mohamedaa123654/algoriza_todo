import 'package:flutter/material.dart';

import '../../../../core/util/color_manager.dart';

class DefualtDropdownButtonFormField extends StatelessWidget {
  DefualtDropdownButtonFormField(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.hint})
      : super(key: key);

  List<String> items;
  final ValueChanged? onChanged;
  String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
          color: ColorManager.grey2,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: DropdownButtonFormField<String>(
        style: const TextStyle(color: ColorManager.grey),
        icon: const Visibility(child: Icon(Icons.keyboard_arrow_down_outlined)),
        iconSize: 24,
        decoration: const InputDecoration(
          // suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
          suffixIconColor: Colors.grey,

          border: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none, width: 0),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
        hint: Text(
          hint,
          style: TextStyle(color: ColorManager.grey),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
