import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  const InputTextWidget({
    Key key,
    @required this.label,
  }) : super(key: key);

  InputBorder get inputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide:
          BorderSide(color: Color.fromRGBO(143, 146, 161, 0.2), width: 2));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ),
        Container(
          height: 48,
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: inputBorder,
                disabledBorder: inputBorder,
                errorBorder: inputBorder,
                focusedBorder: inputBorder,
                focusedErrorBorder: inputBorder,
                border: inputBorder),
          ),
        ),
      ],
    );
  }
}
