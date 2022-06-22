import 'package:flutter/material.dart';
 

class ButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final String textVal;
  final double? btnwidth;
  final TextStyle? txtcolor;
  final String? icon;
  final double? btnheight;
  final double? btnradius;
  final Color? bgColor;
  final TextStyle? txtStyle;
  final double? elevationVal;
  final bool? borderSideVal;
  final bool? btnIcon;
  const ButtonWidget(
      {Key? key,
      this.onPressed,
      required this.textVal,
      this.btnwidth,
      this.txtcolor,
      this.btnradius,
      this.btnheight,
      this.icon,
      this.bgColor,
      this.txtStyle,
      this.elevationVal,
      this.borderSideVal,
      this.btnIcon})
      : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: widget.btnIcon ?? false
          ? const Icon(
              Icons.add,
            
            )
          : const Icon(
              Icons.info,
              size: 0,
            ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widget.btnwidth!, widget.btnheight!),
        primary: widget.bgColor,
        elevation: widget.elevationVal ?? 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.btnradius!),
            side: widget.borderSideVal ?? false
                ? const BorderSide(
             
                   width: 1)
                : BorderSide.none),
      ),
      onPressed: widget.onPressed,
      label: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          widget.textVal,
          style: widget.txtStyle,
        ),
      ),
    );
  }
}
