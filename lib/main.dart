import 'package:baker_street_inquirer/utils/util.dart' as utils;
import 'package:baker_street_inquirer/widgets/dart_info.dart';
import 'package:baker_street_inquirer/widgets/drawer_content.dart';
import 'package:baker_street_inquirer/widgets/inquirer_grid.dart';
import 'package:device_preview/device_preview.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//void main() => runApp(
//  DevicePreview(
//    builder: (context) => MyApp(),
//  ),
//);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //locale: DevicePreview.of(context).locale,
        //builder: DevicePreview.appBuilder,
        title: 'INQUIRER',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BakerStreetPage(),
      ),
      providers: [
        ChangeNotifierProvider.value(
          value: DrawerStateInfo(),
        )
      ],
    );

//    return
  }
}

class BakerStreetPage extends StatefulWidget {
  BakerStreetPage({Key key}) : super(key: key);

  @override
  _BakerStreetPageState createState() => _BakerStreetPageState();
}

class _BakerStreetPageState extends State<BakerStreetPage> {
  var text =
      'In the year 1878 I took my degree of Doctor of Medicine of the University of London, and proceeded to Netley to go through the course prescribed for surgeons in the army. Having completed my studies there, I was duly attached to the Fifth Northumberland Fusiliers as Assistant Surgeon. The regiment was stationed in India at the time, and before I could join it, the second Afghan war had broken out. On landing at Bombay, I learned that my corps had advanced through the passes, and was already deep in the enemy’s country.';

  static var textColor = Color.fromRGBO(0, 0, 0, 0.82);

  var titleStyle = TextStyle(
      fontFamily: 'Hoefler-text',
      fontSize: 32,
      fontStyle: FontStyle.normal,
      color: textColor);

  var textStyle = TextStyle(
      fontFamily: 'Cambria',
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: textColor);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Image.asset(
            'assets/bg.png',
            fit: BoxFit.cover,
          ),
        ),

        LayoutBuilder(builder: (context, boxConstains) {
          var device = utils.deviceType(context);
          if (device == utils.DeviceType.TABLET) {
            return _buildTablet;
          }
          var orientation = MediaQuery.of(context).orientation;
          if (orientation == Orientation.portrait) {
            return _buildPhonePortrait;
          } else {
            return _buildPhoneLandscape;
          }
        }),

//        OrientationBuilder(
//          builder: (context,orientation){
//            print('orientation');
//            if (orientation == Orientation.portrait){
//              return _buildPhonePortrait;
//            }else{
//              return _buildPhoneLandscape;
//            }
//          },
//        ),
      ],
    );
  }

  get _buildTablet => DefaultTabController(
        length: 3,
        initialIndex: Provider.of<DrawerStateInfo>(context).getCurrentDrawer,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(color: textColor),
                elevation: 0.0,
                flexibleSpace: Container(
                  color: Colors.amber,
                ),
                title: Container(
                  height: 36,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                bottom: TabsContent()),
            body: _content(true)),
      );

  get _buildPhoneLandscape => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: textColor),
        elevation: 0.0,
        flexibleSpace: Container(
          color: Colors.amber,
        ),
        title: Container(
          height: 36,
          color: Colors.transparent,
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: Row(
        children: <Widget>[
          SizedBox(
              width: 150.0,
              height: double.infinity,
              child: SingleChildScrollView(
                child: DrawerContent(),
              )),
          Expanded(child: _content(false)),
        ],
      ));

  get _buildPhonePortrait => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: textColor),
          elevation: 0.0,
          flexibleSpace: Container(
            color: Colors.amber,
          ),
          title: Container(
            height: 36,
            color: Colors.transparent,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        drawer: _drawer,
        body: _content(false),
      );

  _content(bool showTitleImage) => CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 16,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '“Give me problems, give me ',
                      style: titleStyle,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' work',
                            style: titleStyle.copyWith(
                                fontStyle: FontStyle.italic)),
                        TextSpan(text: '.”', style: titleStyle),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  if (showTitleImage)
                    Image.asset(
                      'assets/sidney-page-trans.png',
                      height: max(
                        MediaQuery.of(context).size.width / 4,
                        MediaQuery.of(context).size.height / 4,
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  Text(
                    text,
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  victorsAndVilansWidget
                ],
              ),
            ),
          ),
          Grid(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Image.asset(
                    'assets/ornament.png',
                    height: 32.0,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          )
        ],
      );

  get _drawer => Drawer(
        child: DrawerContent(),
      );

  get victorsAndVilansWidget => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1.4,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'victors ',
                  style: TextStyle(
                      fontFamily: 'Cambria',
                      fontSize: 22.4,
                      color: textColor,
                      fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: '&',
                  style: TextStyle(
                      fontFamily: 'LibreBaskerville',
                      fontSize: 22.4,
                      fontStyle: FontStyle.italic,
                      color: textColor),
                ),
                TextSpan(
                  text: ' villains',
                  style: TextStyle(
                      fontFamily: 'Cambria',
                      fontSize: 22.4,
                      color: textColor,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Container(
              height: 1.4,
              color: Colors.grey[400],
            ),
          ),
        ],
      );
}
