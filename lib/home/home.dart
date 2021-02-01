import 'package:covid19_stats/countries/countries.dart';
import 'package:covid19_stats/services/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCountry = Countries.data.first['code'];
  Map<String, dynamic> countryData;

  void onCountryChanged(String country) {
    setState(() => selectedCountry = country);
  }

  Future<void> getCountryData() async {
    final List<dynamic> data = await Api.getCountryData(selectedCountry);
    setState(() => countryData = data.first ?? {});
    print(countryData);
  }

  Future<void> resetCountryData() async {
    setState(() => countryData = null);
    await getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (countryData == null) {
        getCountryData();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(4.0),
                width: MediaQuery.of(context).size.width * 0.75,
                child: DropdownButtonFormField<String>(
                  value: selectedCountry,
                  onChanged: onCountryChanged,
                  items: Countries.dropdownItems,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                  ),
                ),
              ),
              (countryData == null)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (countryData.length > 0)
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            children: <Widget>[],
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Greška',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Došlo je do neočekivane greške prilikom učitavanja podataka. Provjerite internet konekciju, pa pokušajte ponovo.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: resetCountryData,
                                child: Text(
                                  'Pokušaj ponovo',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
