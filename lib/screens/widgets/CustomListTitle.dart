import 'package:flutter/material.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class CustomListTitle extends StatelessWidget {
  final String title, subTitle;
  final bool dense;
  final Function onTap;
  final IconData iconData;
  final Widget trailing, leading;
  CustomListTitle({
    Key key,
    this.title,
    this.dense,
    this.onTap,
    this.iconData,
    this.subTitle,
    this.trailing,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0.0,
      title: Text(
        title ?? '',
        style: TextStyle(color: ColorsUtils.primaryGreen),
      ),
      dense: dense,
      leading: iconData != null
          ? Icon(
              iconData,
              color: ColorsUtils.primaryGreen,
            )
          : leading,
      onTap: onTap ?? () {},
      subtitle: subTitle == null ? null : Text(subTitle),
      trailing: trailing,
    );
  }
}
