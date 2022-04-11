import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utils/utils/responsive_utils.dart';

class WaycardTextField extends StatelessWidget {
  final Color? color;
  final String? label;
  final bool enabled;

  final bool obscure;
  final IconData? icon;
  final bool autoFocus;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Size appSize;

  WaycardTextField({
    this.color,
    this.label,
    this.obscure = false,
    this.icon,
    this.autoFocus = false,
    this.suffixIcon,
    this.focusNode,
    this.validator,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.controller,
    this.onFieldSubmitted,
    this.enabled = true,
    this.inputFormatters,
    this.initialValue,
    required this.appSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: ResponsiveUtils.responsiveSize(
          appSize: appSize, baseValue: 32)),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(
            Radius.circular(ResponsiveUtils.responsiveSize(
                appSize: appSize, baseValue: 30))),
        child: TextFormField(
          style: TextStyle(fontSize: ResponsiveUtils.responsiveSize(
              appSize: appSize, baseValue: 20)),
          enabled: enabled,
          cursorColor: color,
          obscureText: obscure,
          autofocus: autoFocus,
          focusNode: focusNode,
          controller: controller,
          initialValue: initialValue,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          onFieldSubmitted: onFieldSubmitted != null ? (_) =>
              onFieldSubmitted!(_) : null,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            prefixIcon: Material(
              elevation: 0,
              borderRadius: BorderRadius.all(
                  Radius.circular(ResponsiveUtils.responsiveSize(
                      appSize: appSize, baseValue: 30))),
              child: Icon(
                icon,
                size: ResponsiveUtils.responsiveSize(
                    appSize: appSize, baseValue: 32),
                color: color,
              ),
            ),
            suffixIcon: suffixIcon != null ? suffixIcon : null,
            contentPadding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.responsiveSize(
                  appSize: appSize, baseValue: 25),
              vertical: ResponsiveUtils.responsiveSize(
                  appSize: appSize, baseValue: 13),
            ),
          ),
          validator: validator != null ? validator : null,
        ),
      ),
    );
  }
}
