import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projeto_pet_adoption_app/components/button-adoption/button-adoption-widget.dart';
import 'package:projeto_pet_adoption_app/components/placeHolder/placeHolderImage.dart';
import 'package:projeto_pet_adoption_app/components/random-avatar-person/random-avatar-person-widget.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/models/pet-model.dart';
import 'package:projeto_pet_adoption_app/shared/formatacao-texto/formatacao_Texto.dart';

class DetalhesPetPageWiget extends StatelessWidget {
  const DetalhesPetPageWiget({
    Key? key,
    required this.petModel,
  }) : super(key: key);
  final PetModel petModel;

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map(
        (texto) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: textoTabelaPetRow(
              texto,
            ),
          );
        },
      ).toList(),
    );
  }

  Widget tabelaPet(PetModel? petModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: Table(
        border: TableBorder.all(),
        children: [
          _criarLinhaTable('Id, ${petModel?.id.toString() ?? 'N/A'}'),
          _criarLinhaTable('Name, ${petModel!.name ?? 'N/A'}'),
          _criarLinhaTable('Weight , ${petModel.weight ?? 'N/A'}'),
          _criarLinhaTable('BreedGroupd, ${petModel.breedGroup ?? 'N/A'}'),
          _criarLinhaTable('LifeSpan, ${petModel.lifeSpan ?? 'N/A'}'),
        ],
      ),
    );
  }

  buildPetFeature(String value, String feature) {
    return Expanded(
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            textoDetalhePetInfo(
              value,
            ),
            const SizedBox(
              height: 4,
            ),
            textoDetalhePetInfoTitulo(
              feature,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 45,
              child: Hero(
                tag: petModel.image?.url ?? carregarImagem,
                child: CachedNetworkImage(
                  imageUrl: petModel.image?.url ?? carregarImagem,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
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
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textoDetalhePetNome(
                            petModel.name ?? "",
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          petModel.origin == null || petModel.origin == ""
                              ? SizedBox(
                                  height: SizeConfig.safeBlockVertical! * 2.5,
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: SizeConfig.safeBlockHorizontal! * 6,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    textoDetalhePetOrigem(
                                      petModel.origin ?? "",
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(child: ButtonAdoptionWidget()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  buildPetFeature(petModel.id.toString() , "Id"),
                  buildPetFeature(petModel.lifeSpan ?? '', "Lifespan"),
                  buildPetFeature('${petModel.weight ?? ''} Kg', "Weight"),
                ],
              ),
            ),
            textoDetalhePetInformation(
              "Pet information",
            ),
            tabelaPet(petModel),
            const SizedBox(
              height: 16,
            ),
            const RandomAvatarPersonWidget(),
          ],
        ),
      ),
    );
  }
}
