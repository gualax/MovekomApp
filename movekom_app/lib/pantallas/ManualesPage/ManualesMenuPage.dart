
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:movekomapp/Utils/MyColors.dart';
import 'package:movekomapp/Utils/SC.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


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
  }


//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<String> createFileOfPdfUrl(pathToUse) async {
    File file = new File(pathToUse);
    final filename = p.basename(file.path);
    var bytes = await rootBundle.load(pathToUse);
    String dir = (await getApplicationDocumentsDirectory()).path;
    String path = '$dir/$filename';
    writeToFile(bytes,path);
    return path;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       margin: EdgeInsets.only(left:SC.left(40),right:SC.left(40), top: SC.left(15),bottom: SC.left(15) ),
        alignment: Alignment.center,
        child: pdfBox(),
      ),
    );
  }


  Widget pdfBox(){
       return Container(
         padding: EdgeInsets.all(SC.all(15)),
          decoration: new BoxDecoration(
              color: MyColors.baseColor,
          ),
         child: Column(
           children: <Widget>[
             MyContainer(
               margin: EdgeInsets.only(bottom: SC.bot(20)),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text("SELECCIONA EL DOCUMENTO QUE DESEAS LEER",
                   style:MyTextStyle.estilo(20, MyColors.text) ,),
               ),
             ),

             GridView.count(
               mainAxisSpacing: SC.wid(12),
               shrinkWrap: true,
               crossAxisCount: 7,
               children: List.generate(7, (index) {
                 return item(pdfListNames[index]);
               }),
             ),
           ],
         ),
     );
  }

  Widget item(pathOfFile){
    File file = new File(pathOfFile);
    var fname = p.basenameWithoutExtension(file.path);
    fname = fname.toUpperCase();
    return GestureDetector(
      onTap: (){
        createFileOfPdfUrl(pathOfFile).then((finalPath) {
          File file = new File(finalPath);
          var filename = p.basenameWithoutExtension(file.path);
           filename = filename.toUpperCase();
           print(filename);
            return Navigator.push(context,  MaterialPageRoute(builder: (context) => PDFScreen(finalPath,filename)));
        });
      },
      child:  MyContainer(
        margin: EdgeInsets.all(10),
        height: 200,
        width: 150,
        //color: Colors.pink,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: iconSvgD(
                    "assets/icons/pdf_view.svg",
                    Colors.white, 80
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(fname,style: MyTextStyle.estilo(18, MyColors.white),
                    textAlign: TextAlign.center ,)),
            )
          ],
        ),
      ),
    );
  }

  List<String> pdfListNames = [
    "assets/pdf/manejo airtop.pdf",
    "assets/pdf/manejo bomba whale.pdf",
    "assets/pdf/manejo whale.pdf",
    "assets/pdf/manual cargador.pdf",
    "assets/pdf/manual carrocero benimar.pdf",
    "assets/pdf/manual nevera cruise.pdf",
    "assets/pdf/manual regulador solar.pdf",
  ];

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


