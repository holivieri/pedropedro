import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/country_model.dart';
import '../repositories/countries_repository.dart';
import '../services/countries_service.dart';

class CountriesDropDown extends StatefulWidget {
  const CountriesDropDown({
    required this.onChanged,
    super.key,
  });

  final void Function(String, String) onChanged;

  @override
  State<CountriesDropDown> createState() => _CountriesDropDownState();
}

class _CountriesDropDownState extends State<CountriesDropDown> {
  Country? selectedItem;

  Country? get selectedCountry => selectedItem;

  @override
  Widget build(BuildContext context) {
    final CountriesRepository countriesRepository =
        CountriesRepository(CountriesService(Client()));

    return FutureBuilder(
        future: countriesRepository.getCountries(),
        builder: (BuildContext context, AsyncSnapshot<List<Country>> data) {
          if (!data.hasData) {
            return const CircularProgressIndicator();
          } else {
            return SizedBox(
              width: 240,
              child: DropdownButtonFormField<Country>(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                  ),
                ),
                value: selectedItem,
                items: data.data!
                    .map((item) => DropdownMenuItem<Country>(
                          key: Key(item.id),
                          value: item,
                          child: Text(item.name),
                        ))
                    .toList(),
                onChanged: (newvalue) {
                  setState(() {
                    selectedItem = newvalue;
                    widget.onChanged(newvalue!.id, newvalue.name);
                  });
                },
              ),
            );
          }
        });
  }
}
