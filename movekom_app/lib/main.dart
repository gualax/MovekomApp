import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/FloatingMenu.dart';
import 'package:movekomapp/blocs/aguas_limpias_bloc.dart';
import 'package:movekomapp/blocs/alternador_bloc.dart';
import 'package:movekomapp/blocs/bateria_aux_1_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/blocs/calefaccion_bloc.dart';
import 'package:movekomapp/blocs/cargador_220.dart';
import 'package:movekomapp/blocs/cargador_baterias_bloc.dart';
import 'package:movekomapp/blocs/dowligth_bloc.dart';
import 'package:movekomapp/blocs/inversor_bloc.dart';
import 'package:movekomapp/blocs/luces_parque_bloc.dart';
import 'package:movekomapp/blocs/luz_general_bloc.dart';
import 'package:movekomapp/blocs/panel_solar_bloc.dart';
import 'package:movekomapp/blocs/upligth_bloc.dart';
import 'package:movekomapp/controladores/agua/BombaAgua.dart';
import 'package:movekomapp/pantallas/PrincipalHome.dart';
import 'app.localizations.dart';
import 'blocs/aguas_negras_bloc.dart';
import 'blocs/aguas_sucias_bloc.dart';
import 'blocs/bateria_aux_2_bloc.dart';
import 'blocs/bateria_motor_bloc.dart';
import 'blocs/bomba_agua_bloc.dart';
import 'blocs/luces_bano_bloc.dart';
import 'blocs/luces_cocina_bloc.dart';
import 'blocs/luces_habitacion_bloc.dart';
import 'blocs/luces_salon_bloc.dart';
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
        BlocProvider<AlternadorBloc>(builder:(context)=> AlternadorBloc()),
        BlocProvider<Cargador220Bloc>(builder:(context)=> Cargador220Bloc()),
        BlocProvider<PanelSolarBloc>(builder:(context)=> PanelSolarBloc()),
        BlocProvider<BombaAguaBloc>(builder:(context)=> BombaAguaBloc()),
        BlocProvider<AguasLimpiasBloc>(builder:(context)=> AguasLimpiasBloc()),
        BlocProvider<AguasSuciasBloc>(builder:(context)=> AguasSuciasBloc()),
        BlocProvider<AguasNegrasBloc>(builder:(context)=> AguasNegrasBloc()),
        BlocProvider<LucesHabitacionBloc>(builder:(context)=> LucesHabitacionBloc()),
        BlocProvider<LucesSalonBloc>(builder:(context)=> LucesSalonBloc()),
        BlocProvider<LucesCocinaBloc>(builder:(context)=> LucesCocinaBloc()),
        BlocProvider<LucesBanoBloc>(builder:(context)=> LucesBanoBloc()),

        BlocProvider<UpligthBloc>(builder:(context)=> UpligthBloc()),
        BlocProvider<LucesParqueBloc>(builder:(context)=> LucesParqueBloc()),
        BlocProvider<LuzGeneralBloc>(builder:(context)=> LuzGeneralBloc()),
        BlocProvider<DownligthBloc>(builder:(context)=> DownligthBloc()),
        BlocProvider<BoilerBloc>(builder:(context)=> BoilerBloc()),

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

