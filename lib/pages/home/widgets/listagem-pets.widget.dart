import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projeto_pet_adoption_app/components/detalhes-pet/detalhes-pet-widget.dart';
import 'package:projeto_pet_adoption_app/components/placeHolder/placeHolderImage.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/models/pet-model.dart';
import 'package:projeto_pet_adoption_app/pages/detalhes-pet/detalhes-cachorro/detalhes-cachorro-page.dart';
import 'package:projeto_pet_adoption_app/shared/formatacao-texto/formatacao_Texto.dart';


class ListagemPetsWidget extends StatelessWidget {
  const ListagemPetsWidget(this.pets, this.context, {Key? key})
      : super(key: key);

  final List<PetModel>? pets;
  final BuildContext context;


  List<Widget> _listaPets() {
    return pets!.map(
          (PetModel pets) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, a, b) =>
                      DetalhesPetPageWiget(petModel: pets),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 16),
              width: SizeConfig.blockSizeHorizontal! * 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: [
                        Hero(
                          tag:  pets.image?.url ?? carregarImagem,
                          child: CachedNetworkImage(
                            imageUrl: pets.image?.url ?? carregarImagem,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(

                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: pets?.lifeSpan == null ||
                              pets?.lifeSpan == ""
                              ? const SizedBox()
                              : textoListagemVidaUtilPet(
                              pets?.lifeSpan ?? ""),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        textoListagemNomePet(
                          pets?.name ?? "",
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        pets?.origin == null || pets?.origin == ""
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
                              pets?.origin ?? "",
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
        children: _listaPets(),
      ),
    );
  }
}
