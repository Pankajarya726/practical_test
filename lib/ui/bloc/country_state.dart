import 'package:equatable/equatable.dart';
import 'package:practical/model/country_model.dart';

class CountryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CountryInitialState extends CountryState {}

class CountryLoadingState extends CountryState{}

class GetCountrySuccessState extends CountryState {
  final List<CountryModel> countries;

  GetCountrySuccessState({required this.countries});

  @override
  List<Object?> get props => [countries];
}

class GetCountryFailureState extends CountryState {
  final String message;

  GetCountryFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
class FilterCountryState extends CountryState{

  final List<CountryModel> countries;

  FilterCountryState({required this.countries});

  @override
  List<Object?> get props => [countries];

}
