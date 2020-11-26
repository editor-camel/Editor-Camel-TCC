// Import das classes representantes dos elementos EIP (EipWidgets)
import 'package:front/EipWidgets/import_widgets.dart';
// Import das classes representantes dos elementos BASIC (BasicWidgets)
import 'package:front/BasicWidgets/import_widgets.dart';
import 'package:flutter/material.dart';

class LeftSidePane extends StatefulWidget {
  final Function insertNewItem;
  final Map<String, dynamic> projectInfo;
  final Function isProjectCreated;

  LeftSidePane(this.insertNewItem, this.projectInfo, this.isProjectCreated);
  @override
  _LeftSidePaneState createState() => _LeftSidePaneState();
}

// Painel de seleção (lado esquerdo) dos elementos EIP arrastáveis
class _LeftSidePaneState extends State<LeftSidePane> {
  bool itemsMenuOpen = true;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> visualItems;
    Map<String, dynamic> importedWidgets;
    Function itemsMenu;

    if (widget.isProjectCreated() == false)
      itemsMenu = _noProjectMenu;
    else {
      if (widget.projectInfo["type"] == "EIP") {
        visualItems = {"MessagingSystem": [], "MessageRouting": []};
        importedWidgets = eipWidgets;
        itemsMenu = _eipItemsMenu;
      } else if (widget.projectInfo["type"] == "BASIC") {
        visualItems = {"Expression": [], "Conditional": [], "Def": []};
        importedWidgets = basicWidgets;
        itemsMenu = _basicItemsMenu;
      }
      for (String _key in importedWidgets.keys) {
        var visualItem = importedWidgets[_key]();
        print("SUBTYPE SUBTYPE");
        print(widget.projectInfo["type"]);
        print(visualItem.subType);
        visualItems[visualItem.subType]
            .add(visualItem.icon(widget.insertNewItem));
      }
    }
    return Column(
      children: <Widget>[
        itemsMenu(visualItems),
      ],
    );
  }

  Widget _noProjectMenu(Map<String, dynamic> items) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.02, 0, 0, 0),
        child: Container(
          // height: 400,
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.black.withAlpha(50),
                child: Container(
                  height: 50,
                  width: 400,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "No project selected...",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _eipItemsMenu(Map<String, dynamic> eipItems) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.02, 0, 0, 0),
        child: Container(
          // height: 400,
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.black.withAlpha(50),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Messaging System",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GridView.builder(
                    itemCount: eipItems["MessagingSystem"].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 30),
                    itemBuilder: (context, index) {
                      return eipItems["MessagingSystem"][index];
                    },
                  ),
                ),
              ),
              Container(
                // color: Colors.black.withAlpha(50),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Message Routing",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 100,
                  // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GridView.builder(
                    itemCount: eipItems["MessageRouting"].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 30),
                    itemBuilder: (context, index) {
                      return eipItems["MessageRouting"][index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _basicItemsMenu(Map<String, dynamic> basicItems) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.02, 0, 0, 0),
        child: Container(
          // height: 400,
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.black.withAlpha(50),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Expression",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GridView.builder(
                    itemCount: basicItems["Expression"].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 30),
                    itemBuilder: (context, index) {
                      return basicItems["Expression"][index];
                    },
                  ),
                ),
              ),
              Container(
                // color: Colors.black.withAlpha(50),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Conditional",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GridView.builder(
                    itemCount: basicItems["Conditional"].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 30),
                    itemBuilder: (context, index) {
                      return basicItems["Conditional"][index];
                    },
                  ),
                ),
              ),
              Container(
                // color: Colors.black.withAlpha(50),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Def",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GridView.builder(
                    itemCount: basicItems["Def"].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 30),
                    itemBuilder: (context, index) {
                      return basicItems["Def"][index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
