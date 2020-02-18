import 'package:flutter/material.dart';
import 'inquirer_text.dart';
import 'package:baker_street_inquirer/utils/util.dart';

class Grid extends StatelessWidget {

  List assets = <String>[
    'assets/f-holmes.jpg',
    'assets/f-watson.jpg',
    'assets/f-mycroft.jpg',
    'assets/f-moriarty.jpg',
    'assets/f-adler.jpg',
    'assets/f-winter.jpg',
  ];

  List<Name> names = <Name>[
    Name('SHERLOCK','HOLMES'),
    Name('DR JOHN HEMISH','WATSON'),
    Name('MYCROFT','HOLMES'),
    Name('PROF JAMES','MORIARTY'),
    Name('IRENE','ADLER'),
    Name('JAMES','WINTER'),
  ];

  @override
  Widget build(BuildContext context) {

    List<Widget> items  = [];

    for (int i=0 ; i <  names.length;i++){
      items.add(
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8.0,right: 8.0),
                child:AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(
                    assets[i],
                    fit: BoxFit.cover,
                  ),
                )
              ),
              InquirerText(
                subString: names[i].firstName,
                string: names[i].lastname,
                onTap: (){

                },
                active: true,
              )
            ],
          )
      );
    }
    DeviceType device = deviceType(context);
    var orintation = MediaQuery.of(context).orientation;
    var gridCoins = (orintation == Orientation.portrait)
        ? 2
        : (device == DeviceType.PHONE) ? calculate(context) : 6 ;

    if (device == DeviceType.TABLET){
      gridCoins =  calculate(context);
    }
    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCoins,
          childAspectRatio: 0.80
        ),
        delegate: SliverChildListDelegate(
           items
        ),
      ),
    );
  }

  calculate(context){
    var width = MediaQuery.of(context).size.width;
    var coint =  width.toInt() ~/ 200;
    if (coint >= 6 ){
      return 6;
    }
    if (coint >= 3 ){
      return 3;
    }
    return coint;
  }

}

class Name{

  final String firstName;
  final String lastname;

  Name(this.firstName, this.lastname);

}

