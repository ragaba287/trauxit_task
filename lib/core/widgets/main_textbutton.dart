import 'package:flutter/material.dart';

enum ButtonLook { filled, border, text, disable }

class MainTextButton extends StatelessWidget {
  const MainTextButton({
    super.key,
    required this.onPressed,
    this.title = 'title',
    this.buttonLook = ButtonLook.filled,
    this.isLoading = false,
    this.removeSize = false,
    this.color,
    this.borderColor,
    this.borderRadius,
  });

  final Function onPressed;
  final String title;
  final ButtonLook buttonLook;
  final bool isLoading;
  final bool removeSize;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return TextButton(
      onPressed: () =>
          buttonLook == ButtonLook.disable || isLoading ? null : onPressed(),
      style: TextButton.styleFrom(
        backgroundColor: isLoading
            ? Colors.grey
            : {
                  ButtonLook.filled: color ?? theme.colorScheme.primary,
                  ButtonLook.text: Colors.transparent,
                  ButtonLook.disable: const Color(0xff818181),
                }[buttonLook] ??
                const Color(0x10188653),
        fixedSize:
            removeSize ? null : Size(MediaQuery.of(context).size.width, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 3),
          side: BorderSide(
            color: buttonLook == ButtonLook.border
                ? borderColor ?? const Color(0xff188653)
                : Colors.transparent,
          ),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: buttonLook == ButtonLook.text
                    ? const Color(0xff188653)
                    : Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
    );
  }
}
