import 'package:flutter/material.dart';
import 'package:be_the_change/constants.dart';
import 'package:be_the_change/componnents/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String password_word;
  const RoundedPasswordField({
    key,
    required this.onChanged,
    required this.password_word,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: null,
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: password_word,
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
