import 'package:flutter/material.dart';
import 'package:solo_trip_app/common/colors_theme.dart';
import 'package:solo_trip_app/custom_icon.dart';
import 'package:solo_trip_app/data/data_source/all_country_data.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:solo_trip_app/presentation/widget/country_card.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: CustomTextField(
              onPressedSearchButton: () {
                debugPrint("Search Button Clicked!!");
              },
            ),
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CountryCard(
                    country: countryItems[index],
                    index: index,
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
  final VoidCallback? onPressedSearchButton;
  const CustomTextField({
    super.key,
    this.onPressedSearchButton,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _searchController;
  late final ValueNotifier<bool> isFilled;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    isFilled = ValueNotifier(false);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    isFilled.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isFilled,
          builder: (context, value, child) {
            return Expanded(
              flex: 5,
              child: SizedBox(
                height: 52.0,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryLightBackgroundColor,
                    hintText: "Search Country",
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: darkGreyColor,
                        ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 24.0,
                    ),
                    suffixIcon: value
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              isFilled.value = false;
                            },
                          )
                        : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: secondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onChanged: (value) {
                    isFilled.value = value == "" ? false : true;
                  },
                ),
              ),
            );
          },
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: SizedBox(
            height: 52.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
              ),
              onPressed: widget.onPressedSearchButton,
              child: Icon(
                CustomIcon.searchLine,
                color: primaryLightBackgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
