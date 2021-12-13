import 'package:e_wallet/widget/contans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function (String) onChange;
  final Function (String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;

  CustomInput({required this.hintText,required this.onChange,required this.onSubmitted,required this.focusNode,required this.textInputAction,required this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChange,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        style: TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 24, 0, 24),
          labelStyle: TextStyle(
              color: Color(0xFF999999),
              fontSize: 20,
              fontFamily: 'RobotoSlab',
              fontWeight: FontWeight.w700),
          labelText: hintText,
          filled: true,
          fillColor: Color(0xFF730028),
          prefixIcon: Icon(
            Icons.email_rounded,
            size: 26,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFF730028))),
        ),
      ),
    );
  }
}
