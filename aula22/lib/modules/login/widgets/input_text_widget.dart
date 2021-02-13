import 'package:flutter/material.dart';

enum InputTextType { email, password, text }

typedef String InputValidate(String value);

class InputTextWidget extends StatefulWidget {
  final String label;
  final InputTextType type;
  final InputValidate onValidate;
  final void Function(String value) onChange;
  const InputTextWidget({
    Key key,
    @required this.label,
    @required this.onValidate,
    this.type = InputTextType.text,
    this.onChange,
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

  bool obscureText = false;

  String _value = "";

  Widget get mountSuffixIcon {
    if (InputTextWidget._config[widget.type]['obscureText']) {
      return IconButton(
        icon: obscureText
            ? Icon(
                Icons.visibility,
                color: Colors.green,
              )
            : Icon(
                Icons.visibility_off,
              ),
        onPressed: changeObscureText,
      );
    } else if (_value.isNotEmpty && _error == null) {
      return suffixIcon;
    } else {
      return null;
    }
  }

  String _error;

  get height => _error != null ? 72.0 : 48.0;

  void onChangeValidate(String value) {
    _value = value;
    if (widget.onChange != null) {
      widget.onChange(value);
    }
    if (value.isNotEmpty) {
      _error = widget.onValidate(value);
      setState(() {});
    }
  }

  void changeObscureText() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  void initState() {
    obscureText = InputTextWidget._config[widget.type]['obscureText'];
    super.initState();
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
              suffixIcon: mountSuffixIcon,
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
