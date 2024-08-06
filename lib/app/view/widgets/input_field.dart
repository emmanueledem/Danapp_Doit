// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.controller,
    required this.placeholder,
    this.label,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.inputBorder = true,
    this.inputBackgroundColor = AppColors.white,
    this.suffix,
    this.onTap,
    this.prefix,
    this.validationColor = AppColors.inputBorderColor,
    this.prefixSizedBoxWidth = 20,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final bool inputBorder;
  final FocusNode? fieldFocusNode;
  final Function? onTap;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final String? label;
  final double prefixSizedBoxWidth;
  // ignore: inference_failure_on_function_return_type
  final Function(String)? onChanged;

  final int? maxLines;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final Color validationColor;
  final Color inputBackgroundColor;

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool? isPassword;
  double fieldHeight = 56;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Container(
            height: fieldHeight,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.inputBackgroundColor,
              border: widget.inputBorder
                  ? Border.all(
                      color: widget.validationColor,
                    )
                  : Border.all(color: widget.inputBackgroundColor),
            ),
            child: Row(
              children: <Widget>[
                widget.prefix ?? const SizedBox(),
                Expanded(
                  child: TextFormField(
                    cursorColor: AppColors.primaryColor,
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    focusNode: widget.fieldFocusNode,
                    textInputAction: widget.textInputAction,
                    onChanged: widget.onChanged,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.inputtextColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.roboto,
                    ),
                    obscureText: isPassword!,
                    readOnly: widget.isReadOnly,
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: AppColors.inputtextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.roboto,
                      ),
                      // suffix:
                    ),
                  ),
                ),
                widget.suffix ??
                    GestureDetector(
                      onTap: () => setState(() {
                        isPassword = !isPassword!;
                      }),
                      child: widget.password
                          ? Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child: isPassword!
                                  ? SvgPicture.asset(AppAssets.eye)
                                  : SvgPicture.asset(
                                      AppAssets.eyeSlash,
                                    ),
                            )
                          : const SizedBox.shrink(),
                    ),
              ],
            ),
          ),
        ),
        if (widget.validationMessage != null)
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.validationMessage!,
              style: const TextStyle(
                color: AppColors.red,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.roboto,
              ),
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
