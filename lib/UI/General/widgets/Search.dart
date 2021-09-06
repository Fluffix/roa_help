import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';

class Search extends StatefulWidget {
  final TextEditingController controllerText;
  final String findHint;

  const Search(
      {Key key, @required this.controllerText, @required this.findHint})
      : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).disabledColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvg(
                IconsSvg.find,
                width: 20,
                color: Theme.of(context).disabledColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 116,
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    controller: widget.controllerText,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: '${widget.findHint}',
                      hintStyle: Theme.of(context).primaryTextTheme.headline2,
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
