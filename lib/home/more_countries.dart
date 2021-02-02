import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19_stats/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoreCountries extends StatefulWidget {
  @override
  _MoreCountriesState createState() => _MoreCountriesState();
}

class _MoreCountriesState extends State<MoreCountries> {
  Map<String, dynamic> data;

  void resetData() => setState(() => data = null);

  Future<void> getData() async {
    final Map<String, dynamic> countriesData = await Api.getTotalData();
    setState(() => data = countriesData ?? {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (data == null) {
        getData();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Još država'),
      ),
      body: MediaQuery(
        data: MediaQueryData(textScaleFactor: 1.0),
        child: (data == null)
            ? Container(
                margin: EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : (data.length > 0)
                ? Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemCount: data['Countries'].length,
                          itemBuilder: (context, index) {
                            final Map<String, dynamic> countryData =
                                data['Countries'][index];
                            return ExpansionTile(
                              leading: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        'https://www.countryflags.io/${countryData['CountryCode']}/flat/32.png'),
                              ),
                              title: Text(
                                '${countryData['Country']} (engleski)',
                              ),
                              children: <Widget>[
                                ListTile(
                                  title:
                                      Text('${countryData['TotalConfirmed']}'),
                                  subtitle: Text('Zaraženih'),
                                ),
                                ListTile(
                                  title:
                                      Text('${countryData['TotalRecovered']}'),
                                  subtitle: Text('Oporavljenih'),
                                ),
                                ListTile(
                                  title: Text('${countryData['TotalDeaths']}'),
                                  subtitle: Text('Umrlih'),
                                ),
                                ListTile(
                                  title: Text(
                                    'Ažurirano ${DateFormat('dd / MM / yyyy').format(DateTime.parse(countryData["Date"]))}',
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        child: Text(
                          'Omogoućio https://api.covid19api.com/.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      )
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
                          onPressed: resetData,
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
      ),
    );
  }
}
