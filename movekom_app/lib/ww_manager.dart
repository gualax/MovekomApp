
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movekomapp/blocs/list_rebuild_bloc.dart';
import 'package:movekomapp/blocs/p_widget_list.dart';

class ItemsWidget extends StatelessWidget {
  ListRebuildBloc listRebuildBloc;
  Widget build(BuildContext context) {
    listRebuildBloc = BlocProvider.of<ListRebuildBloc>(context);
    return StreamBuilder(
      initialData: bloc.wwList,
      stream: bloc.getWwListStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? widgetsItemsListBuilder(snapshot)
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }

  Widget widgetsItemsListBuilder(snapshot) {
    List<Widget> wwList = snapshot.data;
    return Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: snapshot.data.map<Widget>((item) {
                return GestureDetector(
                    onTap: () {
                      print(" *** AbsorbPointer  ****");
                    },
              child:    AbsorbPointer( // SI EL ITEM YA EXISTE LO REMUEVO
                    absorbing: true,
                    child:item
                  ),
                );
              }).toList()
          );
        }
}

