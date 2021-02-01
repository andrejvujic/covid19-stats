import 'package:flutter/material.dart';

class Countries {
  static List<Map<String, String>> data = [
    {'name': 'Bosna i Hercegovina', 'code': 'ba'},
    {'name': 'Srbija', 'code': 'rs'},
    {'name': 'Hrvatska', 'code': 'hr'},
  ];

  static List<DropdownMenuItem> get dropdownItems {
    final items = <DropdownMenuItem<String>>[];
    for (int i = 0; i < Countries.data.length; i++) {
      items.add(
        DropdownMenuItem(
          child: Text(
            Countries.data[i]['name'],
          ),
          value: Countries.data[i]['code'],
        ),
      );
    }
    return items;
  }
}
