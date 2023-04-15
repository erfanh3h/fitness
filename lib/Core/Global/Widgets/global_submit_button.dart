import 'package:fitness/Core/Resources/app_colors.dart';
import 'package:fitness/Core/Resources/app_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness/Core/Global/Widgets/global_loading.dart';

class GlobalSubmitButton extends StatefulWidget {
  final Function? func;
  final Color? color;
  final Color? fontColor;
  final String? title;
  final double? fontSize;
  final bool isActive;

  const GlobalSubmitButton({
    Key? key,
    required this.func,
    required this.title,
    this.color,
    this.fontColor = Colors.white,
    this.fontSize = 14,
    this.isActive = true,
  }) : super(key: key);

  @override
  State<GlobalSubmitButton> createState() => _GlobalSubmitButtonState();
}

class _GlobalSubmitButtonState extends State<GlobalSubmitButton> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isActive ? 1 : .5,
      child: InkWell(
        onTap: () async {
          if (!widget.isActive) {
            return;
          }
          if (!isloading) {
            setState(() {
              isloading = true;
            });
            await widget.func!();
            try {
              setState(() {
                isloading = false;
              });
            } catch (_) {}
          }
        },
        child: Container(
          height: 40.r,
          decoration: BoxDecoration(
            color: widget.color ?? AppColors.primary,
            borderRadius: AppRadiuses.radiusAll6,
            border: Border.all(
                color: (widget.color ?? AppColors.primary).withOpacity(.66),
                width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: isloading
                ? [const GlobalLoadingWidget()]
                : [
                    widget.title != ''
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              widget.title!.toUpperCase(),
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: widget.fontColor,
                                    fontSize: widget.fontSize,
                                    letterSpacing: 2.5,
                                  ),
                            ),
                          )
                        : Container(),
                  ],
          ),
        ),
      ),
    );
  }
}
