import 'package:flutter/material.dart';

enum InputTextType { email, password, text }

typedef String InputValidate(String value);

class InputTextWidget extends StatefulWidget {
  final String label;
  final InputTextType type;
  final InputValidate onValidate;
  const InputTextWidget({
    Key key,
    @required this.label,
    @required this.onValidate,
    this.type = InputTextType.text,
  }) : super(key: key);

  static final _config = {
    InputTextType.email: {
      "obscureText": false,
      "suffixIcon": Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.green,
      ),
      "textStyle": TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7F85A2)),
      "errorTextStyle": TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
      "border": OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2), width: 2))
    },
    InputTextType.password: {
      "obscureText": true,
      "suffixIcon": Icon(
        Icons.visibility,
      ),
      "textStyle": TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7F85A2)),
      "errorTextStyle": TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
      "border": OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2), width: 2))
    },
    InputTextType.text: {
      "suffixIcon": null,
      "obscureText": false,
      "textStyle": TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7F85A2)),
      "errorTextStyle": TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
      "border": OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2), width: 2))
    },
  };

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  //CONFIGS
  InputBorder get border => InputTextWidget._config[widget.type]['border'];

  TextStyle get textStyle => InputTextWidget._config[widget.type]['textStyle'];

  TextStyle get errorTextStyle =>
      InputTextWidget._config[widget.type]['errorTextStyle'];

  Widget get suffixIcon => InputTextWidget._config[widget.type]['suffixIcon'];

  bool get obscureText => InputTextWidget._config[widget.type]['obscureText'];

  String _error;

  get height => _error != null ? 72.0 : 48.0;

  void onChangeValidate(String value) {
    if (value.isNotEmpty) {
      _error = widget.onValidate(value);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ),
        Container(
          height: height,
          child: TextField(
            onChanged: onChangeValidate,
            obscureText: obscureText,
            style: textStyle,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              enabledBorder: border,
              disabledBorder: border,
              errorBorder: border,
              focusedBorder: border,
              focusedErrorBorder: border,
              border: border,
              errorText: _error,
              errorStyle: errorTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
