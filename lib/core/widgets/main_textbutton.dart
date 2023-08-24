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
    this.titleColor = Colors.white,
    this.borderColor,
    this.borderRadius,
    this.icon,
  });

  final Function onPressed;
  final String title;
  final ButtonLook buttonLook;
  final bool isLoading;
  final bool removeSize;
  final Color? color;
  final Color titleColor;
  final Color? borderColor;
  final double? borderRadius;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          buttonLook == ButtonLook.disable || isLoading ? null : onPressed(),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: isLoading
            ? Colors.grey
            : {
                  ButtonLook.filled:
                      color ?? Theme.of(context).colorScheme.primary,
                  ButtonLook.text: Colors.transparent,
                  ButtonLook.disable: const Color(0xff818181),
                }[buttonLook] ??
                const Color(0x10188653),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: BorderSide(
            color: buttonLook == ButtonLook.border
                ? borderColor ?? const Color(0xff188653)
                : Colors.transparent,
          ),
        ),
      ),
      child: isLoading
          //TODO LOADING BUTTON
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: titleColor,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                if (icon != null) const SizedBox(width: 5),
                if (icon != null) Icon(icon, color: titleColor),
              ],
            ),
    );
  }
}
