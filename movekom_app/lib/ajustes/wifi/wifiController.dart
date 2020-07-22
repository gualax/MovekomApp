import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movekomapp/Utils/Circulos.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WifiController extends StatefulWidget {
  @override
  _WifiControllerState createState() => _WifiControllerState();
}

class _WifiControllerState extends State<WifiController> {

  bool _isEnabled = false;
  bool _isConnected = false;
  bool _isWiFiAPEnabled = false;
  bool _isWiFiAPSSIDHidden = false;
  bool _isWifiAPSupported = true;

  @override
  initState() {

    WiFiForIoTPlugin.isEnabled().then((val) {
      if (val != null) {
        _isEnabled = val;
      }
    });

    WiFiForIoTPlugin.isConnected().then((val) {
      if (val != null) {
        _isConnected = val;
      }
    });

    WiFiForIoTPlugin.isWiFiAPEnabled().then((val) {
      if (val != null) {
        _isWiFiAPEnabled = val;
      }
    }).catchError((val) => _isWifiAPSupported = false);

    WiFiForIoTPlugin.isWiFiAPSSIDHidden().then((val) {
      if (val != null) {
        _isWiFiAPSSIDHidden = val;
      }
    }).catchError((val) => _isWifiAPSupported = false);

    super.initState();
  }

  Future<WIFI_AP_STATE> getWiFiAPState() async {
    int iWiFiState;
    WIFI_AP_STATE wifiAPState;
    try {
      iWiFiState = await WiFiForIoTPlugin.getWiFiAPState();
    } on Exception {
      iWiFiState = WIFI_AP_STATE.WIFI_AP_STATE_FAILED.index;
    }

    if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_DISABLING.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_DISABLING;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_DISABLED.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_DISABLED;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_ENABLING.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_ENABLING;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_ENABLED.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_ENABLED;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_FAILED.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_FAILED;
    }

    return wifiAPState;
  }

  Future<List<APClient>> getClientList(
      bool onlyReachables, int reachableTimeout) async {
    List<APClient> htResultClient;
    try {
      htResultClient = await WiFiForIoTPlugin.getClientList(
          onlyReachables, reachableTimeout);
    } on PlatformException {
      htResultClient = List<APClient>();
    }

    return htResultClient;
  }

  Future<List<WifiNetwork>> loadWifiList() async {
    List<WifiNetwork> htResultNetwork;
    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
    } on PlatformException {
      htResultNetwork = List<WifiNetwork>();
    }

    return htResultNetwork;
  }

  void showClientList() async {
    /// Refresh the list and show in console
    getClientList(false, 300).then((val) => val.forEach((oClient) {
      print("************************");
      print("Client :");
      print("ipAddr = '${oClient.ipAddr}'");
      print("hwAddr = '${oClient.hwAddr}'");
      print("device = '${oClient.device}'");
      print("isReachable = '${oClient.isReachable}'");
      print("************************");
    }));
  }

  @override
  Widget build(BuildContext context) {
    return wifi_widget();
  }



  Widget wifi_widget(){
    Color colorIcons;
    WiFiForIoTPlugin.isEnabled().then((val) => setState(() {
      _isEnabled = val;
    }));

    WiFiForIoTPlugin.isConnected().then((val) => setState(() {
      _isConnected = val;
    }));

    if(_isEnabled){
      colorIcons = MyColors.white;
    } else if(_isConnected){
      colorIcons = MyColors.principal;
    } else {
      colorIcons = MyColors.inactive;
    }

    return GestureDetector(
      onTap: (){
        setState(() {
          WiFiForIoTPlugin.setEnabled(!_isEnabled);

        });
      },
      child: MyContainer(
        height: 190.00,
        width: 190.00,
        color: MyColors.baseColor,
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
                top: 10,left: 10,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("WIFI",
                    style: MyTextStyle.estiloBold(25, MyColors.text),),
                )
            ),
            MyPositioned.fill(
                left: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:iconSvgD("assets/icons/wifi.svg", colorIcons,45),
                )
            ),
            MyPositioned.fill(
                right: 10,top: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child:circuloConSombra(13, MyColors.inactive),
                )
            ),
            MyPositioned.fill(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:Text("Pulsar para activar",
                    style: MyTextStyle.estilo(12, MyColors.inactive),),
                )
            ),
            MyPositioned.fill(
                right: 60,
                child: Align(
                  alignment: Alignment.centerRight,
                  child:Text("Estado",
                    style: MyTextStyle.estilo(12, MyColors.inactive),
                  ),
                )
            ),
            MyPositioned.fill(
                right: 30,top:25,
                child: Align(
                  alignment: Alignment.centerRight,
                  child:Text("Desconectado",
                    style: MyTextStyle.estilo(12, MyColors.inactive),),
                )
            ),
            MyPositioned.fill(
              left:15,bottom:20,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child:iconSvgD("assets/icons/on_off.svg", MyColors.inactive, 20)
              ),
            ),
          ],
        ),
      ),
    );
  }

}


