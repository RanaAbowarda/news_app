import 'package:flutter/material.dart';
import 'package:news_app/tab_list/tab_item.dart';

import '../api/SourceResponse.dart';

class TabWidget extends StatefulWidget {
  TabWidget({super.key, required this.sourceList});
  List<Source> sourceList;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: widget.sourceList
                    .map((source) => TabItem(
                        isSelected: selectedIndex == widget.sourceList.indexOf(source),
                        source: source))
                    .toList()),
          ],
        ));
  }
}
