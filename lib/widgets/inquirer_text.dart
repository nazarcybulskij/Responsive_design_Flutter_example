import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class InquirerText extends StatelessWidget {

  final bool active;
  final VoidCallback onTap;
  final String subString;
  final String string;



  const InquirerText({
    Key key,
    this.active = false,
    this.onTap,
    @required this.subString,
    @required this.string
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var activeColor = Color.fromRGBO(137, 1, 1, 1.0);
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                subString,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'LibreBaskerville',
                    color:  active ? activeColor : Colors.black
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                string,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Book-Antiqua',
                    fontWeight: FontWeight.w700,
                    color:  active ? activeColor : Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap
    );
  }
}
