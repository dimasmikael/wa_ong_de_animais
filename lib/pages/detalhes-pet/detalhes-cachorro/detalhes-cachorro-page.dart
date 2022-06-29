import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projetos/components/button-adoption/button-adoption-widget.dart';
import 'package:projetos/components/placeHolder/placeHolderImage.dart';
import 'package:projetos/components/random-avatar-person/random-avatar-person-widget.dart';
import 'package:projetos/components/size-config/size-config.dart';
import 'package:projetos/models/cachorro-model.dart';
import 'package:projetos/shared/formatacao-texto/formatacao_Texto.dart';

class DetalhesCachorroPage extends StatelessWidget {
  const DetalhesCachorroPage({Key? key, this.cachorro}) : super(key: key);
  final CachorroModel? cachorro;

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((texto) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: textoTabelaPetRow(
            texto,
          ),
        );
      }).toList(),
    );
  }

  Widget tabelaPet(CachorroModel? cachorro) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: Table(
        border: TableBorder.all(),
        children: [
          _criarLinhaTable('Id, ${cachorro?.id ?? ''}'),
          _criarLinhaTable('Name, ${cachorro?.name ?? ''}'),
          _criarLinhaTable('Weight , ${cachorro?.weight?.metric ?? ''}'),
          _criarLinhaTable('BreedGroupd, ${cachorro?.breedGroup ?? ''}'),
          _criarLinhaTable('LifeSpan, ${cachorro?.lifeSpan ?? ''}'),
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
            // color: Colors.grey.shade200,
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
                tag: cachorro?.image?.url ?? carregarImagem,
                child: CachedNetworkImage(
                  imageUrl: cachorro?.image?.url ?? carregarImagem,
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
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textoDetalhePetNome(
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
                                    size: SizeConfig.safeBlockHorizontal! * 6,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  textoDetalhePetOrigem(
                                    cachorro?.origin ?? "",
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ],
                ),
              ),

              // Expanded(child:
              // Container(
              //   width: 20,
              //   height: 20,
              //   color: Colors.blue,
              // ),),
              Expanded(child: ButtonAdoptionWidget()),

// Expanded(child:
//                                     ButtonAdoptionWidget(),),
            ]),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  buildPetFeature(cachorro?.id?.toString() ?? '', "Id"),
                  buildPetFeature(cachorro?.lifeSpan ?? '', "Lifespan"),
                  buildPetFeature(
                      '${cachorro?.weight?.metric ?? ''} Kg', "Weight"),
                ],
              ),
            ),
            textoDetalhePetInformation(
              "Pet information",
            ),
            tabelaPet(cachorro),
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
