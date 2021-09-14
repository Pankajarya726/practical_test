import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practical/model/country_model.dart';
import 'package:practical/ui/bloc/country_bloc.dart';
import 'package:practical/ui/bloc/country_event.dart';
import 'package:practical/ui/bloc/country_state.dart';
import 'package:practical/ui/country_list_item.dart';
import 'package:practical/ui/search_country_screen.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  CountryBloc countryBloc = CountryBloc();
  List<CountryModel> countries = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryBloc>(
      create: (context) => countryBloc,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
          centerTitle: true,
          title: Text(
            "Countries",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .merge(const TextStyle(color: Colors.white)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SearchCountryScreen(
                              countries: countries,
                            )));
              },
              icon: const Icon(Icons.search),
            ),
            PopupMenuButton(
                icon: const Icon(Icons.filter_alt_outlined),
                padding: const EdgeInsets.only(right: 10),
                onSelected: (order) {
                  countryBloc.add(FilterCountryEvent(sortOrder: order! as SortOrder, countries: countries));
                },
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text("Sort by"),
                        value: SortOrder.none,
                        enabled: false,
                      ),
                      const PopupMenuItem(
                        child: Text("Country Name(ascending)"),
                        value: SortOrder.nameAsc,
                      ),
                      const PopupMenuItem(
                        child: Text("Capital(ascending)"),
                        value: SortOrder.capitalAsc,
                      ),
                      const PopupMenuItem(
                        child: Text("Currency(ascending)"),
                        value: SortOrder.currencyAsc,
                      ),
                      const PopupMenuItem(
                        child: Text("Population(ascending)"),
                        value: SortOrder.populationAsc,
                      ),
                      const PopupMenuItem(
                        child: Text("Population(descending)"),
                        value: SortOrder.populationDesc,
                      )
                    ])
          ],
        ),
        body: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryInitialState) {
              countryBloc.add(GetCountryEvent());
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CountryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetCountrySuccessState) {
              countries = state.countries;
            }
            if (state is FilterCountryState) {
              countries = state.countries;
            }

            return ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  CountryModel country = countries[index];
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
                itemCount: countries.length);
          },
        ),
      ),
    );
  }
}

enum SortOrder {
  none,
  nameAsc,
  capitalAsc,
  currencyAsc,
  populationAsc,
  populationDesc
}
