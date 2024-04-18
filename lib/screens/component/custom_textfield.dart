import 'package:attatchments_downloader/ultils/themes/color_style.dart';
import 'package:attatchments_downloader/ultils/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.hintText,
    required this.icon,
    this.label,
    this.isPassword = false,
    this.onSubmitted,
    required this.controller,
    this.validator,
  });

  final String? hintText;
  final String? label;
  final IconData icon;
  final bool? isPassword;
  final void Function(String? value)? onSubmitted;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool? isPassword;
  bool isShowHideIcon = false;

  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPassword = widget.isPassword;
  }

  void toggleHidenPassword(bool value) {
    setState(() {
      isPassword = value;
    });
  }

  void toggleShowHidePassword(String? value) {
    if (value?.isNotEmpty == true || value != null) {
      setState(() {
        isShowHideIcon = true;
      });
    } else {
      setState(() {
        isShowHideIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autocorrect: false,
      enableSuggestions: false,
      controller: widget.controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          // isDense: true,
          contentPadding: EdgeInsets.zero,
          label: Text(
            widget.label ?? "Username",
            style:
                FontResource.bodyXLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          hintText: widget.hintText ?? "",
          suffixIcon: GestureDetector(
              onTapDown: isPassword == true
                  ? (_) {
                      toggleHidenPassword(false);
                    }
                  : null,
              onTapUp: isPassword == true
                  ? (_) {
                      toggleHidenPassword(true);
                    }
                  : null,
              child: Icon(
                isShowHideIcon && isPassword == true
                    ? Icons.remove_red_eye
                    : widget.icon,
                size: 25,
                color: ColorStyle.blackTitle,
              )),
          hintStyle:
              FontResource.bodyMedium.copyWith(fontWeight: FontWeight.w400),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorStyle.blackTitle),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorStyle.blackTitle),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorStyle.blackTitle),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorStyle.error),
          )),
      onChanged: (value) {
        toggleShowHidePassword(value);
      },
      onFieldSubmitted: (value) {
        widget.onSubmitted?.call(value);
      },
      onTapOutside: (event) {
        FocusScope.of(context).requestFocus(focusNode);
      },
    );
  }
}
