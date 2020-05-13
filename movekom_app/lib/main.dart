import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/FloatingMenu.dart';
import 'package:movekomapp/blocs/climatizacion/extractor_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/alternador_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/bateria_aux_1_bloc.dart';
import 'package:movekomapp/blocs/boiler_bloc.dart';
import 'package:movekomapp/blocs/climatizacion/calefaccion_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_220.dart';
import 'package:movekomapp/blocs/electricidad_blocs/cargador_baterias_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/consumos_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/dowligth_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/inversor_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luces_parque_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/luz_general_bloc.dart';
import 'package:movekomapp/blocs/electricidad_blocs/panel_solar_bloc.dart';
import 'package:movekomapp/blocs/iluminacion_blocs/upligth_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_ahorro_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_antiheladas_automatico_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_antiheladas_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_descanso_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_eco_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_emergencia_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_highway_to_hell_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_limpieza_bloc.dart';
import 'package:movekomapp/blocs/modos_blocs/modo_parking_bloc.dart';
import 'package:movekomapp/bluetooth/bluetooth_bloc.dart';
import 'package:movekomapp/controladores/modos/ModoAntiHeladasAuto.dart';
import 'package:movekomapp/controladores/modos/ModoDescanso.dart';
import 'package:movekomapp/pantallas/PrincipalHome.dart';
import 'app.localizations.dart';
import 'package:movekomapp/blocs/agua_blocs/aguas_negras_bloc.dart';
import 'package:movekomapp/blocs/agua_blocs/aguas_sucias_bloc.dart';
import 'package:movekomapp/blocs/agua_blocs/aguas_limpias_bloc.dart';

import 'blocs/electricidad_blocs/bateria_aux_2_bloc.dart';
import 'blocs/electricidad_blocs/bateria_motor_bloc.dart';
import 'blocs/agua_blocs/bomba_agua_bloc.dart';
import 'blocs/item_boiler_bloc.dart';
import 'blocs/iluminacion_blocs/luces_bano_bloc.dart';
import 'blocs/iluminacion_blocs/luces_cocina_bloc.dart';
import 'blocs/iluminacion_blocs/luces_habitacion_bloc.dart';
import 'blocs/iluminacion_blocs/luces_salon_bloc.dart';
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
        BlocProvider<ConsumosBloc>(create:(context)=> ConsumosBloc()),

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
        BlocProvider<ItemBoilerBloc>(create:(context)=> ItemBoilerBloc()),

        BlocProvider<ModoEcoBloc>(create:(context)=> ModoEcoBloc()),
        BlocProvider<ModoAhorroBloc>(create:(context)=> ModoAhorroBloc()),
        BlocProvider<ModoEmergenciaBloc>(create:(context)=> ModoEmergenciaBloc()),
        BlocProvider<ModoDescansoBloc>(create:(context)=> ModoDescansoBloc()),
        BlocProvider<ModoLimpiezaBloc>(create:(context)=> ModoLimpiezaBloc()),
        BlocProvider<ModoHighwayToHellBloc>(create:(context)=> ModoHighwayToHellBloc()),
        BlocProvider<ModoParkingBloc>(create:(context)=> ModoParkingBloc()),
        BlocProvider<ModoAntiHeladasBasicoBloc>(create:(context)=> ModoAntiHeladasBasicoBloc()),
        BlocProvider<ModoAntiHeladasAutoBloc>(create:(context)=> ModoAntiHeladasAutoBloc()),
        BlocProvider<ExtractorBloc>(create:(context)=> ExtractorBloc()),

        BlocProvider<BluetoothControllerBloc>(create:(context)=> BluetoothControllerBloc()),

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
         // primarySwatch: Colors.green,
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

