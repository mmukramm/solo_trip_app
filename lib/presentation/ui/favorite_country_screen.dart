import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/data/database/sqlite_service.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/presentation/widget/country_card.dart';
import 'package:solo_trip_app/presentation/widget/small_page_header.dart';

class FavoriteCountryScreen extends StatefulWidget {
  const FavoriteCountryScreen({super.key});

  @override
  State<FavoriteCountryScreen> createState() => _FavoriteCountryScreenState();
}

class _FavoriteCountryScreenState extends State<FavoriteCountryScreen> {
  late Future<List<Country>>? favouriteCountries;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const SmallPageHeader(
            headerText: "Favorite Country",
            bodyText:
                "This page is list of all your favorite country that you save.",
          ),
          FutureBuilder(
            future: favouriteCountries,
            builder: (context, snapshot) {
              Widget value = Container();

              debugPrint("Connection State: ${snapshot.connectionState}");

              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  break;
                case ConnectionState.none:
                  value = Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      SvgPicture.asset(
                        "assets/images/empty-illustration.svg",
                        height: 200,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Data can't be reached",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: darkGreyColor,
                            ),
                      ),
                    ],
                  );
                  break;
                case ConnectionState.waiting:
                  value = Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: secondaryColor,
                        color: primaryColor,
                      ),
                    ),
                  );
                  break;
                case ConnectionState.done:
                  final List<Country> data = snapshot.data!;
                  // debugPrint("Data: $data");

                  if (data.isEmpty) {
                    value = Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        SvgPicture.asset(
                          "assets/images/empty-illustration.svg",
                          height: 200,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Favorite Country is Empty",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: darkGreyColor,
                                  ),
                        ),
                      ],
                    );
                  } else {
                    if (snapshot.hasError) {
                      value = Text("Error: ${snapshot.error}");
                    }

                    value = Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CountryCard(
                              samplefunction: () => setState(() {
                                fetchData();
                              }),
                              country: data[index],
                              index: index,
                              isFavorite: true,
                            ),
                          );
                        },
                      ),
                    );
                  }
              }

              return value;
            },
          ),
        ],
      ),
    );
  }
}
