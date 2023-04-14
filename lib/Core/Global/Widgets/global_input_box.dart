import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_radiuses.dart';
import 'package:fitness/Core/Resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalInputBox extends StatefulWidget {
  // final Color? color;
  // final IconData? icon;
  final String? label;
  final Function? function;
  final Function? onTapFunction;
  final Function? changeFunction;
  final TextEditingController? controller;
  final bool enable;
  final TextInputType textType;
  final bool readOnly;
  final int minLines;
  final int maxLines;
  final bool mustFill;
  final Function? validator;
  final int? maxLength;
  final double fontSize;
  final TextDirection textDirection;
  final bool hideContent;
  final IconData? endIcon;
  final TextInputAction? textInputAction;
  final String fontFamily;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? changeObscure;
  final bool isPassword;

  const GlobalInputBox({
    Key? key,
    // required this.color,
    // required this.icon,
    required this.label,
    required this.controller,
    this.function,
    this.onTapFunction,
    this.changeFunction,
    this.enable = true,
    this.textType = TextInputType.text,
    this.readOnly = false,
    this.hideContent = false,
    this.minLines = 1,
    this.maxLines = 5,
    this.mustFill = false,
    this.fontSize = 14,
    this.textDirection = TextDirection.ltr,
    this.validator,
    this.maxLength,
    this.endIcon,
    this.textInputAction,
    this.fontFamily = 'montserrat',
    this.inputFormatters,
    this.changeObscure,
    this.isPassword = false,
  }) : super(key: key);

  @override
  GlobalInputBoxState createState() => GlobalInputBoxState();
}

class GlobalInputBoxState extends State<GlobalInputBox> {
  bool isTapped = false;
  Function? validator;
  Function? onChange;
  @override
  void initState() {
    //this use for set default validator
    if (widget.validator != null) {
      validator = widget.validator;
    } else {
      validator = (value) {
        return null;
      };
    }
    if (widget.changeFunction != null) {
      onChange = widget.changeFunction;
    } else {
      onChange = (value) {
        return null;
      };
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: AppRadiuses.radiusAll14,
        color: AppColors().grey90,
      ),
      child: Directionality(
        textDirection: widget.textDirection,
        child: FocusScope(
          onFocusChange: (val) {
            setState(() {
              isTapped = val;
            });
          },
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.hideContent,
            enabled: widget.enable,
            readOnly: widget.readOnly,
            onTap: widget.onTapFunction != null
                ? () async {
                    widget.onTapFunction!();
                  }
                : () {},
            onChanged: (val) => onChange!(val),
            validator: (val) => validator!(val),
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,

            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              counterText: widget.maxLength != null ? null : '',
              counterStyle: const TextStyle(color: Colors.white),
              isDense: false,
              border: InputBorder.none,
              labelText: widget.label!.toUpperCase(),
              labelStyle: TextStyle(
                fontSize: widget.fontSize * 4 / 5,
                color: isTapped ? Colors.black : Colors.black.withOpacity(.5),
              ),
              // enabledBorder:
              //     OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              // focusedBorder:
              //     OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              // errorBorder: const OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Colors.red,
              //   ),
              //   // borderRadius: BorderRadius.circular(15),
              // ),
              // focusedErrorBorder: const OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Colors.red,
              //   ),
              //   // borderRadius: BorderRadius.circular(15),
              // ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        widget.hideContent
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      color: AppColors.primary,
                      onPressed: widget.changeObscure,
                    )
                  : null,
              focusColor: AppColors.primary,
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5),
              // ),
            ),
            // cursorColor: widget.color,
            style: AppTextStyles.headline3,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textType,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
          ),
        ),
      ),
    );
  }
}
