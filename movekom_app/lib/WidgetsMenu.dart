import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/Utils/AllowMultipleGestureRecongnizer.dart';
import 'package:movekomapp/blocs/list_rebuild_bloc.dart';
import 'package:movekomapp/blocs/p_widget_list.dart';
import 'package:movekomapp/responsive_ui/mi_container.dart';
import 'package:movekomapp/responsive_ui/mi_positioned.dart';
import 'package:movekomapp/widgets/IconSvg.dart';
import 'package:movekomapp/widgets/MyTextStyle.dart';
import 'package:movekomapp/ww_manager.dart';
import 'Utils/MyColors.dart';

class WidgetsMenuDialog extends StatefulWidget {
  @override
  _WidgetsMenuDialogState createState() => _WidgetsMenuDialogState();
}

class _WidgetsMenuDialogState extends State<WidgetsMenuDialog> {
  @override
  Widget build(BuildContext context) {

    return _buildAboutDialog2();
  }

  Widget _buildAboutDialog2() {
    return new AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            MyPositioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('WIDGETS',
                    style:MyTextStyle.estiloBold(30, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('RPZ ONE',
                    style:MyTextStyle.estilo(20, Colors.white)),
              ),
            ),
            MyPositioned.fill(
              top: 60,
              child: Align(
                alignment: Alignment.topCenter,
                child: MyContainer(
                  height: 3,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
            ),
        MyPositioned.fill(
          top: 80,
          child: Align(
            child: MyContainer(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                child: ShopItemsWidget(),
              ),
            ),
          ),
        ),
            MyContainer(
                child: MyPositioned.fill(
                  right: 20,
                  child: Align(
                    alignment: Alignment.topRight,
                    child:  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: MyContainer(
                        height: 45,
                        width: 45,
                        child: iconSvgD("assets/icons/close_cross.svg", MyColors.text, 20),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  ListRebuildBloc listRebuildBloc;

  Widget build(BuildContext context) {
    listRebuildBloc = BlocProvider.of<ListRebuildBloc>(context);
    return StreamBuilder(
      initialData: bloc.carrouselList,
      stream: bloc.getCarrouselStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? widgetsItemsListBuilder(snapshot)
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }


  Widget widgetsItemsListBuilder(snapshotCarousel) {
    List<Widget> carlist = snapshotCarousel.data;

    /// BOLUDOOO TENES QUE FIJARTE EN LA OTRA LISTA NO ESTA! EN ESTA OBVIO Q ESTAN TODOS SI ES LA QUE MOSTRAS PARA ELEGIR
    return StreamBuilder(
        initialData: bloc.wwList,
        stream: bloc.getWwListStream,
        builder: (context, snapshot) {
          return Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: snapshot.data.map<Widget>((item) {
                return !carlist.contains(item) ?
                RawGestureDetector(
                  gestures: {
                    AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                        AllowMultipleGestureRecognizer>(
                          () => AllowMultipleGestureRecognizer(),
                          (AllowMultipleGestureRecognizer instance) {
                        instance.onTap = () {
                          print(" *** PARENT TAPPED ****");
                          bloc.addToCarrousel(item);
                          listRebuildBloc.add(Rebuild());
                          Navigator.pop(context);
                        };
                      },
                    )
                  },
                  behavior: HitTestBehavior.opaque,
                  child: item,
                ) : GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      print(" *** AbsorbPointer  ****");
                      bloc.removeFromCarrousel(item);
                      listRebuildBloc.add(Rebuild());
                      Navigator.pop(context);
                    },
                 child: AbsorbPointer(
                   absorbing: true,
                    child: item,
                  ),
                );
              }).toList()
          );
        }
    );
  }


}




