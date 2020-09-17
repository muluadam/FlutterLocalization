import 'package:anrsmis/util/LangFile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anrsmis/dashboard_page1.dart';
import 'package:anrsmis/dashboard_page2.dart';
import 'package:anrsmis/dashboard_page3.dart';
import 'package:anrsmis/localization/localizations.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashboardPage1(),
    DashboardPage2(),
    DashboardPage3()
  ];
  static final List<String> languagesList =[
    "Am",
   "Eng"
  ];
  static final List<String> languageCodesList =[
    "am",
    "en"
  ];
  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };
  String label = languagesList[0];
  void _select(String language) async {
   AppLocalizations.instance.load(Locale(languagesMap[language]));
    setState(() {
      if (language == "Amharic") {
        label = "አማርኛ ";
      } else {
        label = language;
      }
      print("dd "+label);
    });

  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: AppLocalizations.instance.text('title'),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            AppLocalizations.instance.text('title'),
          ),
          actions: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "Lang",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            PopupMenuButton<String>(
              // overflow menu
            onSelected: _select,

              icon: new Icon(Icons.language, color: Colors.white),
              itemBuilder: (BuildContext context) {
              //  AppLocalizations.instance.load(locale)
                return languagesList
                    .map<PopupMenuItem<String>>((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
          _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              title: new Text(AppLocalizations.instance.text(LangFile.TITLE)),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.gesture),
              title: new Text(AppLocalizations.instance.text(LangFile.CATEGORY)),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.timelapse),
                title: Text(AppLocalizations.instance.text(LangFile.ITEM_NAME))
            )
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
