// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    Key? key,
    required this.context,
    this.nextFocusNode,
    this.currentFocusNode,
    required this.title,
    required this.controller,
    this.formDataMapKey,
    this.textInputAction,
    this.isPasswordField,
    this.textInputType,
    this.searchfield,
    this.isLabel,
    this.maxLines,
    this.formData,
    this.prefixIcon,
    this.sufixIcon,
    this.enable,
    this.label,
    required this.validatorFn,
    this.onSaved,
    this.formfield,
    this.maxLength,
    this.inputFormatters,
    this.suffixIcon,
    this.onChangeFunc,
    this.autoValidate,
    this.ontap,
    this.borderColor,
    this.textStyle,
    this.hintTextStyle,
    this.topPaddingValue,
    this.widthpadding,
    this.textCapitalize,
  }) : super(key: key);

  final BuildContext context;
  final FocusNode? nextFocusNode;
  final FocusNode? currentFocusNode;
  final String title;
  final TextEditingController controller;
  final String? formDataMapKey;
  final TextInputAction? textInputAction;
  bool? isPasswordField = false;
  final TextInputType? textInputType;
  final Map<String, dynamic>? formData;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  bool? enable = true;
  bool? searchfield = false;
  bool? formfield = false;
  bool? isLabel = true;
  final String? label;
  final int? maxLines;
  final Function validatorFn;
  final Function? onSaved;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final IconButton? suffixIcon;
  final void Function()? onChangeFunc;
  final AutovalidateMode? autoValidate;
  final Function? ontap;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final double? topPaddingValue;
  final double? widthpadding;
  final bool? textCapitalize;

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return TextFieldWidgetState(
        maxLines: maxLines,
        context: context,
        nextFocusNode: nextFocusNode,
        currentFocusNode: currentFocusNode,
        title: title,
        controller: controller,
        formDataMapKey: formDataMapKey,
        textInputAction: textInputAction,
        isPasswordField: isPasswordField,
        searchfield: searchfield,
        isLabel: isLabel,
        formfield: formfield,
        textInputType: textInputType,
        formData: formData,
        prefixIcon: prefixIcon,
        sufixIcon: sufixIcon,
        enable: enable,
        label: label,
        validatorFn: validatorFn,
        onSaved: onSaved,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        onChangeFunc: onChangeFunc,
        autoValidate: autoValidate,
        borderColor: borderColor,
        textStyle: textStyle,
        hintTextStyle: hintTextStyle,
        topPaddingValue: topPaddingValue,
        widthpadding: widthpadding,
        textCapitalize: textCapitalize);
  }
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  final BuildContext context;
  final FocusNode? nextFocusNode;
  final FocusNode? currentFocusNode;
  final String title;
  final TextEditingController controller;
  final String? formDataMapKey;
  final TextInputAction? textInputAction;
  bool? isPasswordField = false;
  bool? searchfield = false;
  bool? formfield = false;
  bool? isLabel = true;
  final TextInputType? textInputType;
  final Map<String, dynamic>? formData;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? enable;
  final String? label;
  final int? maxLines;
  final Function validatorFn;
  final Function? onSaved;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onChangeFunc;
  final AutovalidateMode? autoValidate;
  final Function? ontap;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final double? topPaddingValue;
  final double? widthpadding;
  final bool? textCapitalize;

  // final FocusNode _focusNode = FocusNode();

  TextFieldWidgetState(
      {required this.context,
      this.nextFocusNode,
      this.currentFocusNode,
      required this.title,
      required this.controller,
      this.formDataMapKey,
      this.textInputAction,
      this.isPasswordField,
      this.textInputType,
      this.formData,
      this.prefixIcon,
      this.formfield,
      this.sufixIcon,
      this.enable,
      this.label,
      this.maxLines,
      this.searchfield,
      this.isLabel,
      required this.validatorFn,
      this.onSaved,
      this.maxLength,
      this.inputFormatters,
      this.onChangeFunc,
      this.autoValidate,
      this.ontap,
      this.borderColor,
      this.textStyle,
      this.hintTextStyle,
      this.topPaddingValue,
      this.widthpadding,
      this.textCapitalize});

  bool _passwordVisible = true;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widthpadding ?? 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                enabled: enable,
                inputFormatters: inputFormatters,
                textInputAction: textInputAction ?? TextInputAction.done,
                textCapitalization: textCapitalize != null
                    ? TextCapitalization.characters
                    : TextCapitalization.none,
                onChanged: (value) =>
                    onChangeFunc != null ? onChangeFunc!() : null,
                keyboardType: textInputType,
                maxLines: maxLines ?? 1,
                focusNode: currentFocusNode,
                maxLength: maxLength,
                controller: controller,
                obscureText: isPasswordField == null ? false : _obscureText,
                decoration: searchfield ?? false
                    ? textsearch()
                    : formfield != null
                        ? formfield!
                            ? textDecoWhite()
                            : textDecoration()
                        : textDecorationForEdit(),
                style: textStyle ?? Theme.of(context).textTheme.bodyText1,
                validator: (String? value) => validatorFn(value),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration textDecoWhite() {
    return InputDecoration(
      contentPadding: maxLines != null
          ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0)
          : const EdgeInsets.symmetric(horizontal: 10.0),
      fillColor: const Color(0xFFF8F5F0),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: borderColor ?? Colors.black, width: 1.0),
      ),
      border: const OutlineInputBorder(),
      hintText: title,
      hintStyle: hintTextStyle ??
          Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white60),
      prefixIcon: prefixIcon,
      prefixStyle: const TextStyle(color: Colors.transparent),
      suffixIcon: isPasswordField ?? false
          ? IconButton(
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              })
          : widget.suffixIcon,
      errorMaxLines: 10,
    );
  }

  InputDecoration textsearch() {
    return InputDecoration(
      contentPadding: maxLines != null
          ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0)
          : const EdgeInsets.symmetric(horizontal: 10.0),
      counterText: '',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      ),
      border: const OutlineInputBorder(),
      hintText: title,
      hintStyle: hintTextStyle ?? Theme.of(context).textTheme.bodyText1!,
      prefixIcon: prefixIcon,
      suffixIcon: isPasswordField ?? false
          ? IconButton(
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                  debugPrint('sdsdsdsd');
                });
              })
          : widget.suffixIcon,
      errorMaxLines: 10,
    );
  }

  InputDecoration textDecoration() {
    return InputDecoration(
        contentPadding: maxLines != null
            ? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0)
            : const EdgeInsets.symmetric(horizontal: 0.0),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(),
        ),
        label: Text(title),
        labelStyle: Theme.of(context).textTheme.bodyText1,
        isDense: true,
        hintText: title,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        prefixIcon: prefixIcon,
        prefixStyle: const TextStyle(color: null),
        suffixIcon: isPasswordField ?? false
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                    _passwordVisible = !_passwordVisible;
                  });
                })
            : widget.suffixIcon,
        errorMaxLines: 10,
        counterText: '');
  }

  InputDecoration textDecorationForEdit() {
    return InputDecoration(
        contentPadding: maxLines != null
            ? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0)
            : EdgeInsets.symmetric(
                horizontal: isPasswordField != null ? 10.0 : 0.0,
                vertical: 1.5),
        enabledBorder: isPasswordField == null
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
        focusedBorder: isPasswordField == null
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
        isDense: isPasswordField != null ? false : true,
        hintText: title,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        prefixIcon: prefixIcon,
        prefixStyle: const TextStyle(color: Colors.transparent),
        suffixIcon: isPasswordField ?? false
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: null,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                    _passwordVisible = !_passwordVisible;
                  });
                })
            : widget.suffixIcon,
        errorMaxLines: 10,
        counterText: '');
  }
}
