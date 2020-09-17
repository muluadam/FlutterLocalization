import 'package:anrsmis/util/LangFile.dart';
import 'package:flutter/material.dart';

import 'localization/localizations.dart';

class DashboardPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Center(
          child: new Text(
            AppLocalizations.instance.text(LangFile.CATEGORY),
            style: new TextStyle(
              fontSize: 22.00,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}