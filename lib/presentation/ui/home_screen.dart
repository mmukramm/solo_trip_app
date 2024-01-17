import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/helpers/app_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 32, left: 32, top: 36),
            height: AppSize.deviceHeight(context) * .28,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20.0),
                ),
                gradient: primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: primaryLightBackgroundColor,
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            child: Image.asset(
                              "assets/images/Logo.png",
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Solo Trip App",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: primaryLightBackgroundColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor.withOpacity(.8),
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/bell-solid.svg",
                          height: 24,
                          width: 24,
                          color: primaryLightBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: primaryLightBackgroundColor),
                      children: [
                        const TextSpan(text: "Welcome"),
                        TextSpan(
                            text: "\nIsmail Ahmad Kanabawi",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: primaryLightBackgroundColor))
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
