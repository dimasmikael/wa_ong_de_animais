import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/main.dart';

class RandomAvatarPersonWidget extends StatelessWidget {
  const RandomAvatarPersonWidget({Key? key}) : super(key: key);

  Widget randomPersonAvatar() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: SizeConfig.safeBlockVertical! * 11,
                width: SizeConfig.safeBlockHorizontal! * 11,
                decoration: BoxDecoration(
                  //  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage("https://i.pravatar.cc/300"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      //   color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Posted by",
                    style: TextStyle(
                      //   color: Colors.grey[600],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Nannie Barker",
                    style: TextStyle(
                      //  color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: themeManager.themeMode == ThemeMode.dark
                      ? Colors.black26
                      : Colors.orange.shade300,
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
              // color: Colors.blue[300],
            ),
            child: const Text(
              "Contact Me",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return randomPersonAvatar();
  }
}
