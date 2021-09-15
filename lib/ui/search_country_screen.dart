import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practical/model/country_model.dart';
import 'package:practical/ui/country_list_item.dart';

class SearchCountryScreen extends StatefulWidget {
  final List<CountryModel> countries;

  const SearchCountryScreen({required this.countries, Key? key})
      : super(key: key);

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  StreamController<List<CountryModel>> controller = StreamController();
  TextEditingController txtSearch = TextEditingController();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        titleSpacing: 10,
        title: TextFormField(
          autofocus: true,
          controller: txtSearch,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            fillColor: Colors.white,
            filled: true,
            hintText: "Search...",
            suffixIcon: IconButton(
              onPressed: () {
                if (txtSearch.text.trim().isEmpty) {
                  Navigator.pop(context);
                } else {
                  txtSearch.clear();
                  controller.add(widget.countries);
                }
              },
              iconSize: 25,
              splashRadius: 13,
              icon: const Icon(Icons.cancel),
            ),
            // suffixIconConstraints:
            //     const BoxConstraints(maxHeight: 30, maxWidth: 30),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onChanged: (text) {
            if (text.trim().isNotEmpty) {
              List<CountryModel> searchList = [];
              for (CountryModel country in widget.countries) {
                if (country.name.toLowerCase().startsWith(text.toLowerCase()) ||
                    country.capital
                        .toLowerCase()
                        .startsWith(text.toLowerCase()) ||
                    country.population.toString().startsWith(text)) {
                  searchList.add(country);
                }
              }
              controller.add(searchList);
            } else {
              controller.add(widget.countries);
            }
          },
        ),
      ),
      body: StreamBuilder<List<CountryModel>>(
        initialData: widget.countries,
        stream: controller.stream,
        builder: (context, snapshot) {


          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  CountryModel country = snapshot.data![index];
                  return CountryListTile(
                    country: country,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.transparent,
                    height: 15,
                  );
                },
                itemCount: snapshot.data!.length);
          }

          return const Center(child: Text("Country not found"));
        },
      ),
    );
  }
}
