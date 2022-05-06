import 'package:flutter/material.dart';

class DescriptionPanel extends StatefulWidget {
  final String Description;
  DescriptionPanel({Key? key, required this.Description}) : super(key: key);
  @override
  _DescriptionPanelState createState() {
    return _DescriptionPanelState();
  }
}

class _DescriptionPanelState extends State<DescriptionPanel> {
  bool _expanded = false;
  var _test = "Full Screen";
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: ExpansionPanelList(
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(
                    'Click To Expand',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
              body: ListTile(
                title: Text(widget.Description,
                    style: TextStyle(color: Colors.black)),
              ),
              isExpanded: _expanded,
              canTapOnHeader: true,
            ),
          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpanded) {
            _expanded = !_expanded;
            setState(() {});
          },
        ),
      ),
    ]);
  }
}
