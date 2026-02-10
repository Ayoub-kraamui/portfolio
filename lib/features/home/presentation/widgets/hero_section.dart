import 'package:flutter/material.dart';
import 'hero_left_content.dart';
import 'hero_right_content.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // تخطيط متجاوب: صف للجهاز (واسع)، عمود للجهاز (سريع)
          bool isDesktop = constraints.maxWidth > 900;

          return isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: HeroLeftContent(
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                    const SizedBox(width: 40),
                    const Expanded(child: HeroRightContent()),
                  ],
                )
              : Column(
                  children: [
                    const HeroRightContent(),
                    const SizedBox(height: 40),
                    HeroLeftContent(width: MediaQuery.sizeOf(context).width),
                  ],
                );
        },
      ),
    );
  }
}
