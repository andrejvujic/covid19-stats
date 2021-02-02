import 'package:flutter/material.dart';

class DataCard extends StatefulWidget {
  @override
  _DataCardState createState() => _DataCardState();

  final int dataNumber, dataChangeNumber;
  final String dataTitle;
  final bool isPositive;
  DataCard({
    this.dataNumber,
    this.dataChangeNumber = 0,
    this.dataTitle,
    this.isPositive = false,
  });
}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          height: 124.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${widget.dataTitle}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              Text(
                '${widget.dataNumber}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (widget.dataChangeNumber > 0)
                  ? Text(
                      '+${widget.dataChangeNumber}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: (widget.isPositive) ? Colors.green : Colors.red,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
