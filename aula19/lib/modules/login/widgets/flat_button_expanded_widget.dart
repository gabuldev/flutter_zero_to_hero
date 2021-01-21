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
      "backgroundColor": Colors.green,
      "textStyle": TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      "border": null,
    },
    FlatButtonExpandedType.none: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(
        color: Colors.grey,
      ),
      "border": null,
    },
    FlatButtonExpandedType.outline: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      "border": const Border.fromBorderSide(BorderSide(color: Colors.grey))
    },
  };

  Color get backgroundColor => _config[type]['backgroundColor'];
  TextStyle get textStyle => _config[type]['textStyle'];
  BoxBorder get border => _config[type]['border'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
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
