import 'package:flutter/material.dart';

class FabBottomAppBarItemRoute {
  FabBottomAppBarItemRoute({this.iconData, this.text});
  IconData? iconData;
  String? text;
}

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar(
      {this.items,
      this.centerItemText,
      this.height = 60.0,
      this.iconSize = 24.0,
      this.backgroundColor,
      this.color,
      this.selectedColor,
      this.notchedShape,
      this.onTabSelected,
      Key? key})
      : super(key: key);
  final List<FabBottomAppBarItemRoute>? items;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;
  @override
  State<FABBottomAppBar> createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;
  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FabBottomAppBarItemRoute? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {

            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
