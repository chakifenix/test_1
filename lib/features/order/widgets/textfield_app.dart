import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldApp extends StatelessWidget {
  TextFieldApp({
    required this.title,
    required this.phoneNumber,
    required this.email,
  });

  final String title;
  final bool phoneNumber;
  final bool email;
  final maskFormatter = new MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
  );

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'не правильно заполнены';
    }
    return null;
  }

  String? validateName(String? name) {
    if (name!.isEmpty || !RegExp(r'^[a-z A-Z а-я А-Я]+$').hasMatch(name)) {
      return 'данные необходимо заполнить';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        color: Color(0xFFF6F6F9),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: (phoneNumber) ? [maskFormatter] : null,
          keyboardType: (phoneNumber)
              ? TextInputType.number
              : (email)
                  ? TextInputType.emailAddress
                  : null,
          validator: (email)
              ? validateEmail
              : (phoneNumber)
                  ? null
                  : validateName,
          decoration: InputDecoration(
              errorStyle: TextStyle(color: Color(0xFFEB5757)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              labelText: title,
              labelStyle: TextStyle(
                color: Color(0xFFA8ABB6),
                fontSize: 17.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
