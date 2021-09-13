import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:rive/rive.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class ItemMainPanel {
  final Widget iconActive;
  final Widget iconInactive;
  final Function onTap;

  ItemMainPanel({this.iconActive, this.iconInactive, this.onTap});
}

class MainPanel extends StatefulWidget {
  final Color backgroundColor;
  final int currentIndex;
  final double height;
  final List<ItemMainPanel> items;
  final Function(int index) onChange;
  final Function onDrugSend;
  final Function onDrugRemove;

  MainPanel({
    @required this.backgroundColor,
    this.currentIndex = 0,
    this.height,
    @required this.items,
    this.onChange,
    this.onDrugSend,
    this.onDrugRemove,
  }) : assert(items.isNotEmpty);

  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  // Artboard _riveArtboard;
  RiveAnimationController _controller;
  bool _isShowDrugButton;
  bool _isPlayingAnimation;

  // void _togglePlay() {
  //   setState(() => _controller.isActive = !_controller.isActive);
  // }

  bool get isPlaying => _controller?.isActive ?? false;

  @override
  void initState() {
    super.initState();
    _isShowDrugButton = true;
    _isPlayingAnimation = false;
  }

  Future<void> startAnimation({@required bool pillWasDrinked}) async {
    setState(() {
      _isPlayingAnimation = true;
    });

    await Future.delayed(Duration(milliseconds: 30));
    setState(() {
      _isShowDrugButton = false;
    });

    if (pillWasDrinked) {
      await Future.delayed(Duration(milliseconds: 2170));
    } else {
      await Future.delayed(Duration(milliseconds: 2170));
    }

    setState(() {
      _isPlayingAnimation = false;
      _isShowDrugButton = true;
    });
  }

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
                      color: Theme.of(context).bottomAppBarColor,
                      borderRadius: BorderRadius.all(Radius.circular(90))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(children: [
                      _isPlayingAnimation
                          ? Container(
                              width: 64,
                              height: 64,
                              child: RiveAnimation.asset(
                                "assets/animations/pill.riv",
                              ),
                            )
                          : SizedBox(),
                      _isShowDrugButton
                          ? Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).focusColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90))),
                              child: Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    if (widget.onDrugSend != null) {
                                      widget.onDrugSend();
                                    }
                                    Vibrate.feedback(FeedbackType.success);
                                    startAnimation(pillWasDrinked: true);
                                  },
                                  onLongPress: () {
                                    if (widget.onDrugSend != null) {
                                      widget.onDrugRemove();
                                    }
                                    Vibrate.feedback(FeedbackType.success);
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: IconSvg(IconsSvg.pills,
                                      color: Theme.of(context)
                                          .cardColor
                                          .withOpacity(1.0),
                                      width: 40,
                                      height: 40),
                                ),
                              ))
                          : SizedBox(),
                    ]),
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
