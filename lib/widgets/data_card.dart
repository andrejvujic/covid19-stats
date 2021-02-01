import 'package:flutter/material.dart';

class DataCard extends StatefulWidget {
  @override
  _DataCardState createState() => _DataCardState();

  final int dataNumber;
  final String dataTile;
  DataCard({
    this.dataNumber,
    this.dataTile,
  });
}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          height: 132.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${widget.dataTile}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.dataNumber}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
