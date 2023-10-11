import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/viewmodels/auth_view_model.dart';

class CustomTextFormField extends StatelessWidget {
  final String khintText;
  final Function onSave;
  final Function validate;

  const CustomTextFormField({super.key, this.khintText = '',required this.onSave,
    required this.validate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.grey,
      ),
      child: TextFormField(
        onSaved: (value) {
          return onSave(value);
        },
        validator: (value) {
          return validate(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: khintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}

class CustomEmailTextFormField extends GetWidget<AuthViewModel> {
  final String khintText;
  final Function onSave;
  final Function validate;
  const CustomEmailTextFormField(
      {super.key,
      this.khintText = '',
      required this.onSave,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.grey,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller.emailController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: khintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        ),
        onSaved: (value) {
          return onSave(value);
        },
        validator: (value) {
          return validate(value);
        },
      ),
    );
  }
}

class CustomPasswordTextFormField extends GetWidget<AuthViewModel> {
  final String khintText;
  final Function onSave;
  final Function validate;
  const CustomPasswordTextFormField(
      {super.key,
      this.khintText = '',
      required this.onSave,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.grey,
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: khintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        ),
        controller: controller.passwordController,
        onSaved: (value) {
          return onSave(value);
        },
        validator: (value) {
          return validate(value);
        },
      ),
    );
  }
}
