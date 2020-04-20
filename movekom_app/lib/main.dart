import 'package:flutter/material.dart';
import 'package:movekomapp/FloatingMenu.dart';
import 'package:movekomapp/pantallas/PrincipalHome.dart';
import 'app.localizations.dart';
import 'pantallas/WheaterMenuPage.dart';
import 'HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(indexToShow:0),
        '/menus': (context) => FloatingMenu(),
        '/principal': (context) => PrincipalHome(),
        '/clima': (context) => ClimaPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        Locale('es','ES'),
        Locale('en','US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],

      localeResolutionCallback: (locale,supportedLocales){
        for(var supportdeLocale in supportedLocales){
          if(supportdeLocale.languageCode == locale.languageCode &&
          supportdeLocale.countryCode == locale.countryCode){
            return supportdeLocale;
          }
        }
        return supportedLocales.first;
      }
    //  home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

