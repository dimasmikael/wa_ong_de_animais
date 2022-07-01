import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';

class CustomContainerHome extends StatelessWidget {
  const CustomContainerHome({
    Key? key,
    this.content,
    this.decoration,
  }) : super(key: key);

  final Widget? content;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockVertical! * 8,
      width: SizeConfig.safeBlockHorizontal! * 8,
      decoration: decoration,
      child: Center(
        child: SizedBox(
            height: SizeConfig.safeBlockVertical! * 7,
            width: SizeConfig.safeBlockHorizontal! * 7,
            child: content),
      ),
    );
  }
}
