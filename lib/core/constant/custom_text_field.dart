import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final int? maxLines;
  final Widget? prefix;
  final Widget? subfix;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Color fillColor;
  final Color borderColor;
  final double paddingN;
  final bool isReadOnly;
  final double hintFontSize;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.maxLines,
    this.textInputType = TextInputType.text,
    this.hintText,
    this.prefix,
    this.validator,
    this.subfix,
    this.obscureText = false,
    this.fillColor = const Color(0xffEEEEEE),
    this.borderColor = const Color(0xffBA0B74),
    this.paddingN = 8,
    this.isReadOnly = false,
    this.hintFontSize = 12,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    final lines = widget.obscureText ? 1 : widget.maxLines;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.paddingN),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode, 
        maxLines: lines,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        obscureText: widget.obscureText,
        readOnly: widget.isReadOnly,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: widget.prefix,
          suffixIcon: widget.subfix,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: const Color(0xff231F20),
            fontSize: widget.hintFontSize.sp,
            fontWeight: FontWeight.w400,
          ),
          fillColor: widget.fillColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 12.0,
          ),
          errorStyle: TextStyle(
            fontSize: 8.sp, 
            height: 1.2, 
            color: AppColors.mainAppColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
        ),
      ),
    );
  }
}
