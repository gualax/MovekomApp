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
    return MultiBlocProvider(
      providers: [
      //  BlocProvider<BlocA>(create: (BuildContext context) => BlocA()),
        BlocProvider<BateriaMotorBloc>(create: (context) => BateriaMotorBloc()),
        BlocProvider<BateriaAux1Bloc>(create:(context)=> BateriaAux1Bloc()),
        BlocProvider<BateriaAux2Bloc>(create:(context)=> BateriaAux2Bloc()),
        BlocProvider<InversorBloc>(create:(context)=> InversorBloc()),
        BlocProvider<CargadorBateriaBloc>(create:(context)=> CargadorBateriaBloc()),
        BlocProvider<CalefaccionBloc>(create:(context)=> CalefaccionBloc()),
        BlocProvider<AlternadorBloc>(create:(context)=> AlternadorBloc()),
        BlocProvider<Cargador220Bloc>(create:(context)=> Cargador220Bloc()),
        BlocProvider<PanelSolarBloc>(create:(context)=> PanelSolarBloc()),
        BlocProvider<BombaAguaBloc>(create:(context)=> BombaAguaBloc()),
        BlocProvider<AguasLimpiasBloc>(create:(context)=> AguasLimpiasBloc()),
        BlocProvider<AguasSuciasBloc>(create:(context)=> AguasSuciasBloc()),
        BlocProvider<AguasNegrasBloc>(create:(context)=> AguasNegrasBloc()),
        BlocProvider<LucesHabitacionBloc>(create:(context)=> LucesHabitacionBloc()),
        BlocProvider<LucesSalonBloc>(create:(context)=> LucesSalonBloc()),
        BlocProvider<LucesCocinaBloc>(create:(context)=> LucesCocinaBloc()),
        BlocProvider<LucesBanoBloc>(create:(context)=> LucesBanoBloc()),

        BlocProvider<UpligthBloc>(create:(context)=> UpligthBloc()),
        BlocProvider<LucesParqueBloc>(create:(context)=> LucesParqueBloc()),
        BlocProvider<LuzGeneralBloc>(create:(context)=> LuzGeneralBloc()),
        BlocProvider<DownligthBloc>(create:(context)=> DownligthBloc()),
        BlocProvider<BoilerBloc>(create:(context)=> BoilerBloc()),

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

