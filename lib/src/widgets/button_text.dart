import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    required this.onClick,
    required this.textLabel,
    this.side,
  }) : super(key: key);

  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final Function onClick;
  final String textLabel;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: borderColor != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 1.5, color: borderColor!),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        side: side,
      ),
      onPressed: () {
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          textLabel,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
