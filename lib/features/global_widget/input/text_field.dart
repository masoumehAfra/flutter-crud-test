import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrudTestTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? counterText;
  final String? initialValue;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffixIconWidget;
  final Widget? iconWidget;
  final Widget? prefixIconWidget;
  final bool? obscureText;
  final bool withBorder;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool? multiLines;
  final bool? enabled;
  final bool readOnly;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;

  final bool withClearButton;
  final double? height;
  final bool? isCollapsed;
  final TextAlignVertical? textAlignVertical;
  final int? maxLength;
  final String? Function(
    String?,
  )? valid;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final double extraSpaceInCollapsed;
  final TextStyle? style;
  final Color? textColor;
  final Color? hintColor;
  final double? hintSize;

  const CrudTestTextField({
    super.key,
    this.labelText,
    this.initialValue,
    this.focusNode,
    this.hintText,
    this.onSubmit,
    this.helperText,
    this.errorText,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.iconWidget,
    this.obscureText,
    this.keyboardType,
    this.controller,
    this.valid,
    this.maxLines,
    this.minLines,
    this.multiLines,
    this.onChanged,
    this.autovalidateMode,
    this.enabled,
    this.readOnly = false,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.prefixText,
    this.suffixText,
    this.contentPadding,
    this.isDense,
    this.withClearButton = false,
    this.withBorder = true,
    this.textDirection,
    this.extraSpaceInCollapsed = 0,
    this.height,
    this.isCollapsed,
    this.textAlignVertical,
    this.hintSize = 8,
    this.counterText,
    this.maxLength,
    this.style,
    this.textColor,
    this.hintColor,
  });

  @override
  State<CrudTestTextField> createState() => _CrudTestTextFieldState();
}

class _CrudTestTextFieldState extends State<CrudTestTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    _controller = widget.controller ??
        TextEditingController(
            text: widget.initialValue == "null" ? null : widget.initialValue);

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return inputField();
  }

  Widget labelText() {
    return Text(widget.labelText!,
        style: const TextStyle(color: Color(0xff8690A2)));
  }

  Widget inputField() {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        controller: _controller,
        textAlignVertical: widget.textAlignVertical,
        // initialValue: widget.initialValue,
        style: _textFieldStyle(context),
        maxLength: widget.maxLength,
        focusNode: _focusNode,

        enabled: widget.enabled,
        onFieldSubmitted: _focusNode.hasFocus ? widget.onSubmit : null,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        maxLines: widget.multiLines == true ? null : widget.maxLines ?? 1,
        minLines: widget.minLines,
        validator: (value) {
          if (widget.valid == null) {
            return null;
          } else {
            return widget.valid!(
              value,
            );
          }
        },
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: widget.withBorder ? const Color(0xff8690A2) : Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: widget.withBorder
                    ? const Color(0xFF0085FF)
                    : Colors.transparent),
          ),
          alignLabelWithHint: (widget.maxLines ?? 1) != 1,
          isCollapsed: widget.isCollapsed,
          errorText: widget.errorText,
          errorMaxLines: 2,
          counterText: widget.counterText,
          isDense: widget.isDense ?? false,
          hintText: widget.hintText,
          helperText: widget.helperText,
          labelText: widget.labelText,
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          labelStyle: _labelStyle(context),
          contentPadding: widget.contentPadding,
          icon: widget.iconWidget,
          hintStyle: _hintStyle(context),
        ),
        onChanged: (value) {
          setState(() {});
          widget.onChanged?.call(value);
        },
        autovalidateMode: widget.autovalidateMode,
        textInputAction: widget.textInputAction,
      ),
    );
  }

  WidgetStateTextStyle _textFieldStyle(BuildContext context) =>
      WidgetStateTextStyle.resolveWith((states) {
        if (widget.textColor != null) {
          return TextStyle(
            color: widget.textColor!,
          );
        }
        if (states.contains(WidgetState.focused)) {
          return const TextStyle(
            color: Colors.black,
          );
        } else if (states.contains(WidgetState.disabled)) {
          return const TextStyle(
            color: Color(0xffD7DEEA),
          );
        }
        return const TextStyle(color: Color(0xff8690A2));
      });

  WidgetStateTextStyle _labelStyle(BuildContext context) =>
      WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.focused)) {
            return const TextStyle(
              color: Colors.black,
            );
          } else if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              color: const Color(0xffD7DEEA),
              fontSize: _controller.text.isEmpty ? 12 : 8,
            );
          }
          return const TextStyle(color: Color(0xff8690A2));
        },
      );

  WidgetStateTextStyle _hintStyle(BuildContext context) =>
      WidgetStateTextStyle.resolveWith(
        (states) {
  return TextStyle(
  color: const Color(0xffD7DEEA), fontSize: widget.hintSize,fontWeight: FontWeight.w300);
  });

}
