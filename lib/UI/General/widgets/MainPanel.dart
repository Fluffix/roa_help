import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class ItemMainPanel {
  final Widget iconActive;
  final Widget iconInactive;
  final Function onTap;

  ItemMainPanel({
    this.iconActive,
    this.iconInactive,
    this.onTap,
  });
}

class MainPanel extends StatefulWidget {
  final Color backgroundColor;
  final int currentIndex;
  final double height;
  final List<ItemMainPanel> items;
  final Function(int index) onChange;

  MainPanel(
      {@required this.backgroundColor,
      this.currentIndex = 0,
      this.height,
      @required this.items,
      this.onChange})
      : assert(items.isNotEmpty);

  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: widget.height ?? 100,
          color: widget.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(widget.items.length, (index) {
              return GestureDetector(
                onTap: () {
                  if (widget.items[index].onTap != null) {
                    widget.items[index].onTap();
                  }
                  if (widget.onChange != null) {
                    widget.onChange(index);
                  }
                },
                child: index == 1
                    ? Padding(
                        padding: const EdgeInsets.only(right: 44.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: index == widget.currentIndex
                                      ? widget.items[index].iconActive
                                      : widget.items[index].iconInactive ??
                                          widget.items[index].iconActive,
                                )),
                            SizedBox(height: 35),
                          ],
                        ),
                      )
                    : index == 2
                        ? Padding(
                            padding: const EdgeInsets.only(left: 44.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: index == widget.currentIndex
                                          ? widget.items[index].iconActive
                                          : widget.items[index].iconInactive ??
                                              widget.items[index].iconActive,
                                    )),
                                SizedBox(height: 35),
                              ],
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: index == widget.currentIndex
                                        ? widget.items[index].iconActive
                                        : widget.items[index].iconInactive ??
                                            widget.items[index].iconActive,
                                  )),
                              SizedBox(height: 35),
                            ],
                          ),
              );
            }),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.transparent,
              height: 112,
              width: 88,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(90))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            color: Theme.of(context).focusColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(90))),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconSvg(IconsSvg.pills,
                              color:
                                  Theme.of(context).cardColor.withOpacity(1.0),
                              width: 40,
                              height: 40),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    ]);
  }
}
