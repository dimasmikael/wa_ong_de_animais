// import 'package:app_expedicao/common/size-config/size-config.dart';
// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   CustomAppBar({
//     this.title,
//     this.assetUrl,
//     this.leading,
//     this.actions,
//     Key key,
//   }) : super(key: key);
//
//   final String? title;
//   final String? assetUrl;
//   final Widget? leading;
//   final List<Widget>? actions;
//
//   Widget _title(context) {
//     if (this.title != null) {
//       return Text(
//         title,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: SizeConfig.safeBlockHorizontal * 6,
//         ),
//       );
//     } else {
//       return Image.asset(this.assetUrl, fit: BoxFit.contain, height: 60);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(
//         SizeConfig.blockSizeVertical * 8,
//       ),
//       child: AppBar(
//         actions: this.actions,
//         leading: this.leading,
//         backgroundColor: Colors.amber,
//         elevation: 2,
//         iconTheme: IconThemeData(
//             color: Colors.white, size: SizeConfig.safeBlockHorizontal * 6),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [_title(context)],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => new Size.fromHeight(60.0);
// }
