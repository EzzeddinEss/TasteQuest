import 'package:flutter/material.dart';
import 'package:tastequest/util/palette.dart';
import 'package:tastequest/widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color colour;
  final Color textColor;
  final double kHeight;
  final double kwidth;
  final double kradius;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    this.text = '',
    this.colour = kPrimaryColor,
    this.textColor = Colors.white,
    required this.onPressed,
    this.kHeight = 50,
    this.kwidth = 130,
    this.kradius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeight,
      width: kwidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colour),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kradius),
              side: const BorderSide(color: Colors.green),
            ),
          ),
        ),
        child: CustomText(
            text: text,
            colour: textColor,
            fontSize: 18,
            alignment: Alignment.center),
      ),
    );
  }
}

class SocialCustomElevatedButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color colour;
  final Color textColor;
  final double kHeight;
  final double kwidth;
  final double kradius;
  //final Color imageColor;
  final VoidCallback onPressed;

  const SocialCustomElevatedButton({
    Key? key,
    this.text = '',
    this.imagePath = '',
    //this.imageColor = Colors.white,
    this.colour = kPrimaryColor,
    this.textColor = Colors.white,
    required this.onPressed,
    this.kHeight = 50,
    this.kwidth = 130,
    this.kradius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeight,
      width: kwidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colour),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kradius),
              side: const BorderSide(color: Colors.green),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Image.asset(
                  imagePath,
                  //color: imageColor,
                )),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            CustomText(
                text: text,
                colour: textColor,
                fontSize: 18,
                alignment: Alignment.center),
          ],
        ),
      ),

      // ElevatedButton.icon(
      //   onPressed: onPressed,
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.all(colour),
      //     shape: MaterialStateProperty.all(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(kradius),
      //         side: const BorderSide(color: Colors.green),
      //       ),
      //     ),
      //   ),
      //   // icon: Padding(
      //   //   padding: const EdgeInsets.all(8.0),
      //   //   child: Center(child: Image.asset(imagePath)),
      //   // ),
      //   label: const Text(''),

      // ),
    );
  }
}
