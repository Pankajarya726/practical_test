import 'package:equatable/equatable.dart';
import 'package:practical/model/country_model.dart';
import 'package:practical/ui/country_screen.dart';

class CountryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCountryEvent extends CountryEvent {}

class FilterCountryEvent extends CountryEvent{

  final List<CountryModel> countries;
  final SortOrder sortOrder;

  FilterCountryEvent({required this.sortOrder,required this.countries});

  @override
  List<Object?> get props => [sortOrder,countries];

}

