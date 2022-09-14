import '../model/country.dart';
import 'package:flutter/material.dart';

class CountryController {
  List<Country> items = [
    Country(
      image: 'https://cdn-icons-png.flaticon.com/512/197/197484.png',
      title: 'Estados Unidos',
      prefix: '+1',
    ),
    Country(
      image: 'https://cdn-icons-png.flaticon.com/512/5111/5111560.png',
      title: 'Brazil',
      prefix: '+55',
    ),
    Country(
      image: 'https://cdn-icons-png.flaticon.com/512/197/197571.png',
      title: 'Germany',
      prefix: '+49',
    ),
    Country(
      image: 'https://cdn-icons-png.flaticon.com/512/197/197374.png',
      title: 'United Kingdom',
      prefix: '+44',
    ),
    Country(
      image: 'https://cdn-icons-png.flaticon.com/512/3909/3909323.png',
      title: 'France',
      prefix: '+33',
    ),
    Country(
      image: 'https://cdn-icons-png.flaticon.com/512/197/197593.png',
      title: 'Spain',
      prefix: '+34',
    ),
  ];
  Country? initial;
  Country? selectedCountry;

  setValue(Country value) {
    selectedCountry = value;
  }
}
