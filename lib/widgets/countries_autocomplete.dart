import 'package:flutter/material.dart';

import '../country_page.dart';

const List<Country> countryOptions = <Country>[
  Country(name: 'Africa', size: 30370000),
  Country(name: 'Asia', size: 44579000),
  Country(name: 'Australia', size: 8600000),
  Country(name: 'Brasil', size: 110879),
  Country(name: 'Canada', size: 9984670),
  Country(name: 'França', size: 42916),
  Country(name: 'Inglaterra', size: 10180000),
  Country(name: 'India', size: 3287263),
  Country(name: 'America do norte', size: 24709000),
  Country(name: 'America do sul', size: 17840000),
];

class CountriesAutocomplete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountriesAutocompleteState();
}

class _CountriesAutocompleteState extends State<CountriesAutocomplete> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<Country>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return countryOptions
            .where((Country county) => county.name
                .toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase()))
            .toList();
      },
      displayStringForOption: (Country option) => option.name,
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(fontWeight: FontWeight.normal),
        );
      },
      onSelected: (Country selection) {
        print('Selecionado: ${selection.name}');
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Country> onSelected,
          Iterable<Country> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(1),
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 1,
              children: [
                Container(
                  width: 368,
                  color: Colors.grey[400],
                  child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Country option = options.elementAt(index);

                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(
                          title: Text(option.name,
                              style: const TextStyle(color: Colors.black)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
