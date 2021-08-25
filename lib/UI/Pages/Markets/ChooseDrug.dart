import 'package:flutter/material.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class Selectable extends StatelessWidget {
  final String title;
  final bool isForList;

  const Selectable({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: isForList
            ? _buildItem(context, isForList: true)
            : Container(
                width: MediaQuery.of(context).size.width * 2035 / 414,
                decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(15)),
                child: _buildItem(context),
              ));
  }

  Widget _buildItem(BuildContext context, {bool isForList = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      child: Row(
        children: [
          isForList ? SizedBox() : IconSvg(IconsSvg.chooseDrug, width: 17),
          SizedBox(
            width: 16,
          ),
          Padding(
            padding: isForList
                ? EdgeInsets.symmetric(horizontal: 26.0)
                : EdgeInsets.all(0.0),
            child: Text(
              '$title',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
