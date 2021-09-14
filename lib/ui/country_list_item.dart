import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practical/model/country_model.dart';

class CountryListTile extends StatelessWidget {
  final CountryModel country;
  const CountryListTile({required this.country, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                  child: SvgPicture.network(
                    country.flag,
                    // semanticsLabel: 'Flag',
                    fit: BoxFit.contain,
                    allowDrawingOutsideViewBox: false,
                    excludeFromSemantics: false,
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.width * 0.25,
                    placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(30.0),
                        child: const CircularProgressIndicator()),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(country.name,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                      Text(
                        country.capital,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "population : " + country.population.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                          "currency : " +
                              country.currencies.first.name +
                              "(${country.currencies.first.code})",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}
