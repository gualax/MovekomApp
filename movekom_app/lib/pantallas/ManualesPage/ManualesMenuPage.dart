
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:path_provider/path_provider.dart';


class ManualesMenuPage extends StatefulWidget {
  @override
  _ManualesMenuPageState createState() => _ManualesMenuPageState();
}

class _ManualesMenuPageState extends State<ManualesMenuPage> {
  BuildContext mContext;

  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f;
        print(pathPDF);
      });
    });
  }

  void write() async {
    final filename = 'test.pdf';
    var bytes = await rootBundle.load("assets/pdf/movekom1.pdf");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
  }


//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<String> createFileOfPdfUrl() async {
    final filename = 'movekom1.pdf';
    var bytes = await rootBundle.load("assets/pdf/movekom1.pdf");
    String dir = (await getApplicationDocumentsDirectory()).path;
    String path = '$dir/$filename';
    writeToFile(bytes,path);
    return path;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       margin: EdgeInsets.all(SC.all(40)),
        alignment: Alignment.center,
        child: pdfBox(),
      ),
    );
  }


  Widget pdfBox(){
       return Container(
         padding: EdgeInsets.all(SC.all(20)),
          decoration: new BoxDecoration(
              color: MyColors.baseColor,
          ),
         child: Column(
           children: <Widget>[
             MyContainer(
               margin: EdgeInsets.only(bottom: SC.bot(15)),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text("SELECCIONA EL DOCUMENTO QUE DESEAS LEER",
                   style:MyTextStyle.estilo(20, MyColors.text) ,),
               ),
             ),
             GridView.count(
               shrinkWrap: true,
               crossAxisCount: 7,
               children: List.generate(10, (index) {
                 return item();
               }),
             ),
           ],
         ),
     );
  }

  Widget item(){
    return GestureDetector(
      onTap: (){
        return Navigator.push(context,  MaterialPageRoute(builder: (context) => PDFScreen(pathPDF,"movekom_manual")));
      },
      child:iconSvgD(
        "assets/icons/pdf_view.svg",
        Colors.white, 15),
    );
  }

}


class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  String name = "";

  PDFScreen(this.pathPDF,this.name);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text(name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }

}


