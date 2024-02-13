import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';

class FirstLandingPageContent extends StatelessWidget {
  const FirstLandingPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Welcome to",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: darkGreyColor),
          ),
          Text(
            "Solo Trip App",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text("Select the country for your solo trip destination",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: darkGreyColor,
                  )),
        ],
      ),
    );
  }
}

class SecondLandingPageContent extends StatelessWidget {
  const SecondLandingPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: primaryColor,
                ),
          ),
          Text(
            "Select the country and save it so you always remember your destination.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: darkGreyColor,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: darkGreyColor,
                ),
          ),
        ],
      ),
    );
  }
}

class ThirdLandingPageContent extends StatelessWidget {
  const ThirdLandingPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: darkGreyColor,
                ),
          ),
          Text(
            "Happy Exploring",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: darkGreyColor,
                ),
          ),
        ],
      ),
    );
  }
}
