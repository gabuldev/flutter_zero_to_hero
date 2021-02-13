import 'package:flutter/material.dart';

enum FlatButtonExpandedType { fill, none, outline }

class FlatButtonExpandedWidget extends StatelessWidget {
  final String label;
  final FlatButtonExpandedType type;
  final VoidCallback onTap;
  const FlatButtonExpandedWidget({
    Key key,
    @required this.label,
    this.type = FlatButtonExpandedType.fill,
    @required this.onTap,
  }) : super(key: key);

  static const _config = {
    FlatButtonExpandedType.fill: {
      "backgroundColor": Color(0xFF27AE60),
      "textStyle": TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      "border": null,
      "height": 58.0,
    },
    FlatButtonExpandedType.none: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(color: Colors.grey, fontSize: 14),
      "height": 22.0,
    },
    FlatButtonExpandedType.outline: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
      "border": Border.fromBorderSide(
          BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2))),
      "height": 58.0,
    },
  };

  Color get backgroundColor => _config[type]['backgroundColor'];
  TextStyle get textStyle => _config[type]['textStyle'];
  BoxBorder get border => _config[type]['border'];
  double get height => _config[type]['height'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: border,
        ),
        child: Center(
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
