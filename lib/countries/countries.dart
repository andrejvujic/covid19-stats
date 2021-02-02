import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Countries {
  static List<Map<String, String>> data = [
    {
      'name': 'Bosna i Hercegovina',
      'code': 'ba',
      'slug': 'bosnia-and-herzegovina'
    },
    {'name': 'Srbija', 'code': 'rs', 'slug': 'serbia'},
    {'name': 'Hrvatska', 'code': 'hr', 'slug': 'croatia'},
    {'name': 'Crna Gora', 'code': 'me', 'slug': 'montenegro'},
    {'name': 'Slovenija', 'code': 'si', 'slug': 'slovenia'},
  ];

  static List<DropdownMenuItem> get dropdownItems {
    final items = <DropdownMenuItem<String>>[];
    for (int i = 0; i < Countries.data.length; i++) {
      items.add(
        DropdownMenuItem(
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                  imageUrl:
                      'https://www.countryflags.io/${Countries.data[i]['code']}/flat/32.png'),
              SizedBox(width: 8.0),
              Text(
                Countries.data[i]['name'],
              ),
            ],
          ),
          value: Countries.data[i]['slug'],
        ),
      );
    }
    return items;
  }
}
