// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class RSTextFormField extends StatelessWidget {
  RSTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.hintTextStyle,
    this.labelTextStyle,
    this.textInputAction,
    this.keyboardType,
    this.onEditingComplete,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.obscureText = false,
    this.onChanged,
    this.controller,
    this.onTap,
    this.labelText,
    this.readOnly = false,
    this.isLast = false,
    this.autoFocus = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefix,
    this.mainColor = Colors.black,
    this.textColor = Colors.black,
  });
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final bool isLast;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final void Function()? onEditingComplete;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int minLines;
  final Color? mainColor;
  final Color? textColor;
  TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        autofocus: autoFocus,
        cursorColor: mainColor,
        // cursorHeight: 30,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          // floatingLabelBehavior:
          labelText: labelText,
          hintText: hintText,
          hintStyle: hintTextStyle,
          labelStyle: labelTextStyle,
          prefix: prefix,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          /**/
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: mainColor!)),
          // counter: Offstage(),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: mainColor!)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: mainColor!),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.red),
          ),
          suffixIcon: suffixIcon,
          fillColor: Colors.white.withOpacity(0.04),
          // prefixIcon: Row(
          //   children: [
          //   // if(prefixIcon!=null)Icon(prefixIcon, color: mainColor,size: 22,),
          //   // if(prefix!=null)prefix!
          //   ],
          // ),
          prefixIcon: prefixIcon,
          filled: true,
        ),
        onTap: onTap,
        maxLines: maxLines,
        minLines: minLines,
      ),
    );
  }
}
