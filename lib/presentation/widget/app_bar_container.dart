import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/data/database/sqlite_service.dart';
import 'package:solo_trip_app/data/models/country.dart';

class AppBarContainer extends StatefulWidget {
  final Country? country;
  final String title;
  final bool withRightIcon;

  const AppBarContainer({
    super.key,
    this.country,
    required this.title,
    this.withRightIcon = false,
  });

  @override
  State<AppBarContainer> createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  late int countryId;
  late Future<List<Country>>? favouriteCountries;

  @override
  void initState() {
    super.initState();
    fetchData();
    countryId = widget.country?.id ?? 0;
  }

  void fetchData() {
    try {
      favouriteCountries = SqliteService.getItems();
      debugPrint("fetch data success");
    } catch (e) {
      debugPrint("There's some error when fetching data: $e");
      favouriteCountries = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: primaryGradient,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48.0,
                    width: 48.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: secondaryLightBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Center(
                        child: Icon(
                          CustomIcon.caretLineLeft,
                          color: primaryColor,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                  if (widget.withRightIcon)
                    FutureBuilder(
                      future: favouriteCountries,
                      builder: (context, snapshot) {
                        bool isFavorite = false;

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: 48.0,
                            width: 48.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: secondaryLightBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Icon(
                                  CustomIcon.heartLine,
                                  color: primaryColor,
                                  size: 28.0,
                                ),
                              ),
                            ),
                          );
                        }

                        for (var element in snapshot.data!) {
                          if (countryId == element.id) {
                            isFavorite = true;
                            break;
                          }
                        }

                        return SizedBox(
                          height: 48.0,
                          width: 48.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              backgroundColor: secondaryLightBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            onPressed: () {
                              isFavorite
                                  ? SqliteService.deleteItem(widget.country!.id)
                                  : SqliteService.insertItem(widget.country!);

                              setState(() {
                                fetchData();
                              });
                            },
                            child: Center(
                              child: Icon(
                                isFavorite
                                    ? CustomIcon.heartSolid
                                    : CustomIcon.heartLine,
                                color: primaryColor,
                                size: 28.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            Center(
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: primaryLightBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
