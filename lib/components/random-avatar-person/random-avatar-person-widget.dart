import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/main.dart';
import 'package:projeto_pet_adoption_app/shared/formatacao-texto/formatacao_Texto.dart';

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
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage("https://i.pravatar.cc/300"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 0),
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
                  textoAvatarRandomPosted(
                    "Posted by",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  textoAvatarRandom(
                    "Alex",
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
            ),
            child: textoContactButton(
              "Contact Me",
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
