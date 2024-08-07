import 'package:danapp_doit/app/app.dart';
import 'package:danapp_doit/core/core.dart';

import 'package:flutter/cupertino.dart';
import 'package:logger/web.dart';

class BusyButton extends StatefulWidget {
  const BusyButton({
    required this.title,
    required this.onpress,
    super.key,
    this.deactivate = false,
    this.width,
    this.height,
    this.loading = false,
    this.backgroundColor = AppColors.primaryColor,
    this.titleColor = AppColors.white1,
    this.fontSize = 16,
  });
  final String title;
  final bool? deactivate;
  final bool loading;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback onpress;
  final double? width;
  final double? height;
  final double fontSize;
  @override
  State<BusyButton> createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ignore: use_if_null_to_convert_nulls_to_bools
      onTap: widget.deactivate == true ? null : widget.onpress,
      child: Container(
        height: widget.height ?? 56,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          // ignore: use_if_null_to_convert_nulls_to_bools
          color: widget.deactivate == true
              ? AppColors.deactivatedColor
              : widget.backgroundColor,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Center(
          child: widget.loading
              ? const CupertinoActivityIndicator()
              : TextRegular(
                  widget.title,
                  fontSize: widget.fontSize,
                  color: widget.titleColor,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
