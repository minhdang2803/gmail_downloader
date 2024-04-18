import 'package:attatchments_downloader/ultils/themes/color_style.dart';
import 'package:attatchments_downloader/ultils/themes/font_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    this.onTap,
    this.textStyle,
    this.isDisable = true,
  });
  final String text;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final void Function()? onTap;
  final bool? isDisable;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisable == false ? widget.onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
            color: widget.isDisable ?? false
                ? ColorStyle.disable
                : ColorStyle.secondary,
            borderRadius: BorderRadius.circular(
              30,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text,
                style: widget.textStyle ??
                    FontResource.bodyMedium.copyWith(
                      color: widget.isDisable ?? false
                          ? ColorStyle.blackTitle
                          : Colors.white,
                    )),
          ],
        ),
      ),
    );
  }
}
