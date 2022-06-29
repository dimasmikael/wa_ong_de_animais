import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projetos/components/placeHolder/placeHolderImage.dart';
import 'package:projetos/components/size-config/size-config.dart';
import 'package:projetos/models/cachorro-model.dart';
import 'package:projetos/pages/detalhes-pet/detalhes-cachorro-page.dart';
import 'package:projetos/pages/home/home_page.dart';
import 'package:projetos/shared/formatacao_Texto.dart';

class  ListagemDogsWidget extends StatefulWidget {
  const ListagemDogsWidget(this.cachorros, this.context, {Key? key})
      : super(key: key);

  final List<CachorroModel>? cachorros;
  final BuildContext context;


  @override
  _ListagemDogsWidgetState createState() => _ListagemDogsWidgetState();
}

class _ListagemDogsWidgetState extends State<ListagemDogsWidget> {

  List<Widget> _listaCachorros() {
    List<BoolRandom> itemOfList = shuffle(Fake.getSomeValues, 2);

   itemOfList.forEach((e) => print(e.geraBoleano));


 // String ww = itemOfList.forEach(
 //          (e) =>e.geraBoleano);
    List names = ['jerry','mark','john'];
    final randomNumberGenerator = Random();
    final randomBoolean = randomNumberGenerator.nextBool();

    Color _favIconColor = Colors.grey;
    bool _isTap = false;
    return widget. cachorros!.map(
      (CachorroModel cachorro) {

        cachorro.teste==itemOfList;
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, a, b) =>
                      DetalhesCachorroPage(cachorro: cachorro),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.only(
                  right: //index != null
                      // ?
                      10,
                  //  : 0,
                  left: //index != null
                      // ?
                      10,
                  //  : 0,
                  bottom: 16),
              width: SizeConfig.blockSizeHorizontal! * 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: [
                        Hero(
                          tag: cachorro.image?.url ?? carregarImagem,
                          child: CachedNetworkImage(
                            imageUrl: cachorro.image?.url ?? carregarImagem,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, i) =>
                                const SpinKitFadingCircle(color: Colors.amber),
                            errorWidget: (context, i, error) =>
                                Image.network(carregarImagem),
                          ),
                        ),

                  ]),),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:
                                // pet.condition == "Adoption" ?
                                Colors.orange[100],
                            // : pet.condition ==
                            // "Disappear" ? Colors.red[100] : Colors
                            // .blue[100],
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child:
                          Text
                            (
                              cachorro.teste.toString()??""
                          )
                          // Text(
                          //
                          //   element .toString()??"hh",
                          //  // "cachorro?.lifeSpan??",
                          //   style: const TextStyle(
                          //     color:
                          //         //    pet.condition == "Adoption" ?
                          //         Colors.orange,
                          //     // : pet.condition == "Disappear"
                          //     // ? Colors.red
                          //     // : Colors.blue
                          //
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 12,
                          //   ),
                          // ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        textoListagemNomePet(
                          cachorro?.name ?? "",
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        cachorro?.origin == null || cachorro?.origin == ""
                            ? SizedBox(
                                height: SizeConfig.safeBlockVertical! * 2.5,
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey[600],
                                    size: SizeConfig.safeBlockVertical! * 2.5,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  textoListagemOrigemPet(
                                    cachorro?.origin ?? "",
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 100,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _listaCachorros(),
      ),
    );
  }
}
