import 'package:flutter/material.dart';
import 'package:tastequest/util/palette.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
              colors: [kPrimaryColor, Colors.black45],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/food.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))),
      ),
    );
  }
}

class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
                colors: [kPrimaryColor, Color(0xFF868686)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            .createShader(bounds),
        blendMode: BlendMode.dstATop,
        child: Container(
          color: Colors.transparent,
          foregroundDecoration: const BoxDecoration(
            color: Colors.transparent,
            backgroundBlendMode: BlendMode.darken,
          ),
        ),
      ),
    );
  }
}
