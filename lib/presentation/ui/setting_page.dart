import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/presentation/state/theme_provider.dart';
import 'package:solo_trip_app/presentation/widget/app_bar_container.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBarContainer(
            title: "Settings",
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark Mode",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  Consumer<ThemeProvider>(
                    builder: (context, value, child) {
                      return Switch(
                        value: value.isDarkMode,
                        onChanged: (val) {
                          value.changeThemeMode(val);
                        },
                        activeColor: secondaryColor,
                        activeTrackColor: primaryColor,
                        inactiveThumbColor: primaryColor,
                        inactiveTrackColor: secondaryColor,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
