import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? textInputFormatter;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? textStyle;
  final String labelName;
  final AutovalidateMode mode;
  final Function(String)? onChanged;
  // final IconData labelIcon;
  final bool? isReadOnly;
  final Color? fillColor;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final String? Function(String?)? validatorFunction;
  final Function(String)? onSubmittedFunction;
  final Function(String)? onSavedFunction;
  final Function()? onTapFunction;
  final TextStyle? labelStyle;
  final Widget? suffix;
  final int? minLines;
  final Widget? labelWidget;
  final Widget? prefixWidget;

  final int? maxLines;
  final FocusNode? focus;
  const CommonTextField({
    super.key,
    this.textInputFormatter,
    this.labelWidget,
    this.prefixWidget,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.initialValue,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.words,
    this.isReadOnly = false,
    required this.textStyle,
    required this.mode,
    required this.labelName,
    // required this.labelIcon,
    required this.validatorFunction,
    this.onSubmittedFunction,
    this.onTapFunction,
    this.onSavedFunction,
    this.fillColor,
    this.prefixIconColor,
    this.prefixIconSize,
    this.labelStyle,
    this.suffix,
    this.minLines,
    this.maxLines,
    this.focus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: keyboardType,
        //minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        focusNode: focus,
        initialValue: null,
        readOnly: isReadOnly ?? false,
        controller: controller,
        onTap: onTapFunction,
        autovalidateMode: mode,
        onChanged: onChanged,

        inputFormatters: textInputFormatter,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        // style: bodyMediumStyle(context).copyWith(color: appBlackColor),

        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            filled: fillColor != null ? true : false,
            fillColor: fillColor,
            prefixIcon: prefixWidget,
            // floatingLabelStyle:
            //     TextStyle(color: appTextGreyColor, fontSize: 15.h),
            // labelStyle: bodyMediumStyle(context)
            //     .copyWith(color: appTextGreyColor, fontSize: 17.h),
            // label: labelWidget,
            // border: InputBorder.none,
            // hintStyle: bodyMediumStyle(context).copyWith(
            //   color: appTextGreyColor,
            // ),
            hintText: labelName,
            labelText: labelName,
            counterText: '',
            suffix: suffix),
        validator: validatorFunction,
        onFieldSubmitted: onSubmittedFunction,
      ),
    );
  }
}
