import 'package:covid19_stats/countries/countries.dart';
import 'package:covid19_stats/services/api.dart';
import 'package:covid19_stats/widgets/data_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCountry = Countries.data.first['code'];
  Map<String, dynamic> countryData;
  Map<dynamic, dynamic> totalData;

  Future<void> reset() async {
    setState(() {
      countryData = null;
      totalData = null;
    });
  }

  void onCountryChanged(String country) {
    setState(() => selectedCountry = country);
    getCountryData();
  }

  Future<void> getCountryData() async {
    final dynamic data = await Api.getCountryData(selectedCountry);
    setState(() => countryData = ((data?.length ?? 0) > 0) ? data.first : {});
  }

  Future<void> resetCountryData() async {
    setState(() => countryData = null);
  }

  Future<void> getTotalData() async {
    final dynamic data = await Api.getTotalData();
    setState(() => totalData = ((data?.length ?? 0) > 0) ? data : {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (countryData == null) {
        getCountryData();
      }

      if (totalData == null) {
        getTotalData();
      }
    });

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: reset,
        child: ListView(
          children: <Widget>[
            SafeArea(
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
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        DataCard(
                                          dataTitle: 'ZARAŽENIH',
                                          dataNumber: countryData['confirmed'],
                                        ),
                                        DataCard(
                                          dataTitle: 'OPORAVLJENIH',
                                          dataNumber: countryData['recovered'],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        DataCard(
                                          dataTitle: 'UMRLIH',
                                          dataNumber: countryData['deaths'],
                                        ),
                                        DataCard(
                                          dataTitle: 'KRITIČNIH',
                                          dataNumber: countryData['critical'],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Ažurirano ${DateFormat('dd / MM / yyyy').format(DateTime.parse(countryData["lastUpdate"]))}',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
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
                    (totalData == null)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (totalData.length > 0)
                            ? Column(
                                children: <Widget>[
                                  Text(
                                    'SVIJET',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      DataCard(
                                        dataTitle: 'ZARAŽENIH',
                                        dataNumber: totalData['Global']
                                            ['TotalConfirmed'],
                                        dataChangeNumber: totalData['Global']
                                            ['NewConfirmed'],
                                      ),
                                      DataCard(
                                        dataTitle: 'UMRLIH',
                                        dataNumber: totalData['Global']
                                            ['TotalDeaths'],
                                        dataChangeNumber: totalData['Global']
                                            ['NewDeaths'],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      DataCard(
                                        dataTitle: 'OPORAVLJENIH',
                                        dataNumber: totalData['Global']
                                            ['TotalRecovered'],
                                        dataChangeNumber: totalData['Global']
                                            ['NewRecovered'],
                                        isPositive: true,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Ažurirano ${DateFormat('dd / MM / yyyy').format(DateTime.parse(totalData["Global"]["Date"]))}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
