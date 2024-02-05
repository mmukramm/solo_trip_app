import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/data/data_source/all_country_data.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/helpers/app_size.dart';
import 'package:solo_trip_app/helpers/formatter.dart';
import 'package:solo_trip_app/presentation/ui/country_detail.dart';
import 'package:solo_trip_app/presentation/widget/small_page_header.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Country> countryItems = List.from(countryList);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SmallPageHeader(
            headerText: 'Country List',
            bodyText:
                'Select the country to see the detail. You can save it so add it to your favorite country if you have interest to go that.',
          ),
          const SizedBox(
            height: 24.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: CustomTextField(),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: countryItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CountryDetail(
                          country: countryItems[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom:
                            (index == countryItems.length - 1) ? 12.0 : 4.0),
                    height: AppSize.deviceHeight(context) * .1,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(4.0, 4.0),
                            blurRadius: 4.0,
                            color: Colors.black.withOpacity(.15)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Hero(
                            tag: countryItems[index].backdropImage,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/${countryItems[index].backdropImage}"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12.0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12.0),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 1.2, sigmaY: 1.2),
                                  child: Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    decoration: BoxDecoration(
                                      gradient: primaryGradient,
                                      backgroundBlendMode: BlendMode.softLight,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0,
                                          ),
                                          child: Text(
                                            countryItems[index].countryName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  color:
                                                      primaryLightBackgroundColor,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: secondaryLightBackgroundColor,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(12.0),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(CustomIcon.usersSolid,
                                        color: secondaryDarkBackgroundColor,
                                        size: 20.0),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      Formatter.populationFormatter(
                                          countryItems[index].population),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: secondaryDarkBackgroundColor,
                                          ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(CustomIcon.poland,
                                        color: secondaryDarkBackgroundColor,
                                        size: 20.0),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      countryItems[index].region,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: secondaryDarkBackgroundColor,
                                          ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 56.0,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: secondaryLightBackgroundColor,
                hintText: "Search Country",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
              ),
              onPressed: () {},
              child: const Center(child: Icon(CustomIcon.searchLine)),
            ),
          ),
        ),
      ],
    );
  }
}
