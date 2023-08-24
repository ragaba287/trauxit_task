import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    this.lable = 'Email',
    this.teController,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.prefixIcon,
    this.textInputAction,
    this.padding = const EdgeInsetsDirectional.symmetric(),
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  final String lable;
  final TextEditingController? teController;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function(String value)? validator;
  final TextInputType keyboardType;
  final int? maxLines;
  final IconData? prefixIcon;
  final EdgeInsetsDirectional padding;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        enabled: enabled,
        maxLines: maxLines ?? 1,
        obscureText: obscureText,
        validator: (value) => validator!(value!),
        keyboardType: keyboardType,
        controller: teController,
        textInputAction: textInputAction,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: suffixIcon,
          ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 90,
            minHeight: 20,
            minWidth: 35,
          ),
          contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          constraints: const BoxConstraints(maxHeight: 52),
          hintText: lable,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xff757779),
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: Color(0x200F172A),
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: Color(0x200F172A),
              width: 1.5,
            ),
          ),
          errorStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xffDB3546),
          ),
        ),
        // decoration: ,
      ),
    );
  }
}
