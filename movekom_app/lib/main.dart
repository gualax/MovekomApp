import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/FloatingMenu.dart';
import 'package:movekomapp/blocs/bateria_aux_1_bloc.dart';
import 'package:movekomapp/blocs/calefaccion_bloc.dart';
import 'package:movekomapp/blocs/cargador_baterias_bloc.dart';
import 'package:movekomapp/blocs/inversor_bloc.dart';
import 'package:movekomapp/pantallas/PrincipalHome.dart';
import 'app.localizations.dart';
import 'blocs/bateria_aux_2_bloc.dart';
import 'blocs/bateria_motor_bloc.dart';
import 'pantallas/Wheater/WheaterMenuPage.dart';
import 'HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<BateriaMotorBloc>(builder: (context) => BateriaMotorBloc()),
        BlocProvider<BateriaAux1Bloc>(builder:(context)=> BateriaAux1Bloc()),
        BlocProvider<BateriaAux2Bloc>(builder:(context)=> BateriaAux2Bloc()),
        BlocProvider<InversorBloc>(builder:(context)=> InversorBloc()),
        BlocProvider<CargadorBateriaBloc>(builder:(context)=> CargadorBateriaBloc()),
        BlocProvider<CalefaccionBloc>(builder:(context)=> CalefaccionBloc()),

      ],
      child: MaterialApp(
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
      ),
    );
  }
}

