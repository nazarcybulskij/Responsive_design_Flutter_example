import 'package:baker_street_inquirer/widgets/dart_info.dart';
import 'package:baker_street_inquirer/widgets/inquirer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TabsContent extends StatelessWidget  implements PreferredSizeWidget{



  TabsContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _tabsContent(context);
  }

  _tabsContent(context) => TabBar(
    tabs: [
      _buildItem(context,'THE','WEBLOGUE', 0),
      _buildItem(context,'BACK','ISSUES', 1),
      _buildItem(context,'ABOUT','OUR PAPER', 2),
    ],
    indicatorColor:  Color.fromRGBO(137, 1, 1, 1.0),
  );

  _buildItem(context,String subString,String string, int index) {
    var selectedItem = Provider.of<DrawerStateInfo>(context).getCurrentDrawer;
    return Material(
        color: Colors.transparent,
        child: InquirerText(
          subString: subString,
          string: string,
          active: index == selectedItem,
          onTap: () {
            Provider.of<DrawerStateInfo>(context,listen: false).setCurrentDrawer(index);
            DefaultTabController.of(context).index = index;
          },
        )
    );
  }

  @override
  Size get preferredSize => Size(0,50);

}


class DrawerContent extends StatelessWidget {

  DrawerContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _drawerContent(context);
  }

  _drawerContent(context) => Container(
    color: Colors.white,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.all(
            (MediaQuery.of(context).orientation == Orientation.portrait)
                ? 32.0
                : 12.0
          ),
          child: Image.asset(
            'assets/sidney-page.jpg',
            fit: BoxFit.cover,
          ),
        ),
        _buildItem(context,'THE','WEBLOGUE', 0),
        _buildDivider(context,0),
        _buildItem(context,'BACK','ISSUES', 1),
        _buildDivider(context,1),
        _buildItem(context,'ABOUT','OUR PAPER', 2),
        _buildDivider(context,2),
      ],
    ),
  );

  _buildDivider(context,int index) {
    var selectedItem = Provider.of<DrawerStateInfo>(context).getCurrentDrawer;
    if (selectedItem == index) {
      return Container(
        height: 32,
        child: Image.asset(
          'assets/ornament.png',
          fit: BoxFit.fitHeight,
        ),
      );
    } else {
      return Container(
        height: 32,
        child: Center(
          child: Container(
            height: 1.4,
            color: Colors.grey[400],
          ),
        ),
      );
    }
  }

  _buildItem(context,String subString,String string, int index) {
    var selectedItem = Provider.of<DrawerStateInfo>(context).getCurrentDrawer;
    return Material(
        color: Colors.transparent,
        child: InquirerText(
          subString: subString,
          string: string,
          active: index == selectedItem,
          onTap: () {
            Provider.of<DrawerStateInfo>(context,listen: false).setCurrentDrawer(index);
            var orintation = MediaQuery.of(context).orientation;
            if (orintation == Orientation.portrait){
              Future.delayed(Duration(milliseconds: 300)).then((value) {
                Navigator.of(context).pop();
              });
            }
          },
        )
    );
  }

}


