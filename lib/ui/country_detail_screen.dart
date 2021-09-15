import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practical/model/country_model.dart';

class CountryDetailScreen extends StatelessWidget {
  final CountryModel country;

  CountryDetailScreen(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Text(
          "${country.name}",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: Colors.white)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.width * 0.40,
                child: SvgPicture.network(
                  country.flag,
                  // semanticsLabel: 'Flag',
                  fit: BoxFit.contain,
                  allowDrawingOutsideViewBox: false,
                  excludeFromSemantics: false,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                  placeholderBuilder: (BuildContext context) =>
                      Container(padding: const EdgeInsets.all(30.0), child: const CircularProgressIndicator()),
                ),
              ),
            ),
            Center(
              child: Text(country.name,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Capital : " + country.capital,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Region: " + country.region,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Population : " + country.population.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Currency name : " + country.currencies.first.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            Text("Currency code : " + country.currencies.first.code,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            Text("Currency symbol : " + country.currencies.first.symbol,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            Text("Calling code : " + country.callingCodes.first,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            Text("Bordering countries code : ",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(
                country.borders.length,
                (index) => Text("${country.borders[index]}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
