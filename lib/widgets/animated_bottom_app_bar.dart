import 'package:flutter/material.dart';

class AnimatedBottomAppBar extends StatefulWidget {
  final List<BottomItem> barItems;
  final Duration animationDuration;

  static const DEFAULT_DURATION = 200;

  AnimatedBottomAppBar(
      {this.barItems,
      this.animationDuration = const Duration(milliseconds: DEFAULT_DURATION)});

  @override
  _AnimatedBottomAppBarState createState() => _AnimatedBottomAppBarState();
}

class _AnimatedBottomAppBarState extends State<AnimatedBottomAppBar>
    with TickerProviderStateMixin {
  int selectedItem = 0;

  buildItems() {
    var menuItems = <Widget>[];

    for (int i = 0; i < widget.barItems.length; i++) {
      var barItem = widget.barItems[i];

      bool isSelected = selectedItem == i;
      var color = barItem.color;
      var icon = barItem.iconData;
      var title = barItem.title;

      menuItems.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedItem = i;
            });
          },
          child: BarItem(
            animationDuration: widget.animationDuration,
            isSelected: isSelected,
            icon: icon,
            color: color,
            title: title,
            tickerProvider: this,
          ),
        ),
      );
    }
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildItems(),
        ),
      ),
    );
  }
}

class BottomItem {
  final String title;
  final IconData iconData;
  final Color color;

  BottomItem({this.title, this.iconData, this.color});
}

class BarItem extends StatelessWidget {
  final Duration animationDuration;
  final bool isSelected;
  final IconData icon;
  final Color color;
  final String title;
  final TickerProvider tickerProvider;

  BarItem(
      {this.animationDuration,
      this.isSelected,
      this.icon,
      this.color,
      this.title,
      this.tickerProvider});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: isSelected ? color : Colors.black54,
            size: 24,
          ),
          SizedBox(
            width: 8,
          ),
          AnimatedSize(
            vsync: tickerProvider,
            duration: animationDuration,
            curve: Curves.easeInOut,
            child: Text(
              isSelected ? title : '',
              style: TextStyle(
                color: color,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
