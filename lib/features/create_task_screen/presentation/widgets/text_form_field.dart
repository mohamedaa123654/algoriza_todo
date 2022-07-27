import 'package:flutter/material.dart';

import '../../../../core/util/color_manager.dart';

class TextFormFieldTitle extends StatelessWidget {
  TextFormFieldTitle({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  ValueChanged<String>? onSubmit;
  ValueChanged<String>? onChange;
  VoidCallback? onTap;
  bool isPassword;
  FormFieldValidator<String> validate;
  String? label;
  String? hintText;
  IconData? prefix;
  IconData? suffix;
  VoidCallback? suffixPressed;
  bool isClickable;

  DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.hintText,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    required this.validate,
    this.label,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.grey2,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: ColorManager.primary,
        style: TextStyle(color: ColorManager.grey),
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: ColorManager.grey,
              fontSize: 16,
            ),
            fillColor: ColorManager.grey,
            focusColor: ColorManager.grey,
            labelStyle: const TextStyle(color: ColorManager.grey),
            prefixIcon: prefix != null
                ? Icon(
                    prefix,
                    color: ColorManager.grey,
                  )
                : null,
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                      color: ColorManager.grey,
                    ),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: ColorManager.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorManager.grey,
                    width: 0.0,
                    style: BorderStyle.none),
                borderRadius: BorderRadius.circular(5)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorManager.grey,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
