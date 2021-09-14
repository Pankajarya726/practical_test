import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical/model/country_model.dart';
import 'package:practical/ui/bloc/country_event.dart';
import 'package:practical/ui/bloc/country_repository.dart';
import 'package:practical/ui/bloc/country_state.dart';
import 'package:practical/ui/country_screen.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryRepository repository = CountryRepository();

  CountryBloc() : super(CountryInitialState());

  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is GetCountryEvent) {
      yield* getCountries();
    }
    if (event is FilterCountryEvent) {
      yield CountryLoadingState();
      yield* sortCountries(event.sortOrder, event.countries);
    }
  }

  Stream<CountryState> getCountries() async* {
    yield CountryLoadingState();
    List<CountryModel> countries = await repository.getCountries();

    if (countries.isNotEmpty) {
      yield GetCountrySuccessState(countries: countries);
    } else {
      yield GetCountryFailureState(message: "Record not found");
    }
  }

  Stream<CountryState> sortCountries(
      SortOrder sortOrder, List<CountryModel> countries) async* {
    List<CountryModel> countryList = countries;

    if (sortOrder == SortOrder.nameAsc) {
      countries
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      yield FilterCountryState(countries: countries);
    }
    if (sortOrder == SortOrder.capitalAsc) {
      countries.sort(
          (a, b) => a.capital.toLowerCase().compareTo(b.capital.toLowerCase()));
      yield FilterCountryState(countries: countries);
    }
    if (sortOrder == SortOrder.currencyAsc) {
      countries.sort((a, b) => a.currencies.first.name
          .toLowerCase()
          .compareTo(b.currencies.first.name.toLowerCase()));
      yield FilterCountryState(countries: countries);
    }
    if (sortOrder == SortOrder.populationAsc) {
      countries.sort((a, b) => a.population.compareTo(b.population));
      yield FilterCountryState(countries: countries);
    }
    if (sortOrder == SortOrder.populationDesc) {
      countries.sort((a, b) => b.population.compareTo(a.population));
      yield FilterCountryState(countries: countries);
    }
  }
}
