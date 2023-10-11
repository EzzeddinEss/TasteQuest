import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  final String kText1;
  final String kText2;
  final Function kOnTap;
  const CustomTextSpan({
    super.key,
    this.kText1 = '',
    this.kText2 = '',
    required this.kOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white60),
        children: <TextSpan>[
          TextSpan(
            text: kText1,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          TextSpan(
              text: kText2,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = kOnTap as GestureTapCallback?)
        ],
      ),
    );
  }
}
