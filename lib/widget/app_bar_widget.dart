import 'package:color_app/util/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  String title = "";

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  AppBarWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      automaticallyImplyLeading: false,
      centerTitle: true,
      titleSpacing: 0,
      elevation: 0,
      /*leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Container(
          constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
          child: _widget.getAppBarBackIcon(),
        ),
      ),*/
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: CustomColors.colorWhite,
        ),
      ),
    );
  }
}
