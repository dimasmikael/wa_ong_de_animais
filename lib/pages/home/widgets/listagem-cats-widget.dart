import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projetos/components/placeHolder/placeHolderImage.dart';
import 'package:projetos/components/size-config/size-config.dart';
import 'package:projetos/models/cachorro-model.dart';
import 'package:projetos/models/gato-model.dart';
import 'package:projetos/pages/detalhes-pet/detalhes-gato-page.dart';

class ListagemCatsWidget extends StatelessWidget {
  const ListagemCatsWidget(this.gatos, this.context, {Key? key})
      : super(key: key);

  final List<GatoModel>? gatos;
  final BuildContext context;
  //
  // Widget _listagemGatos(int index) {
  //   print(cachorros?[index].image?.url);
  //   return GestureDetector(
  //     onTap: () {
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) => PetDetail(pet: pet)),
  //       // );
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //         // color: Colors.white,
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(20),
  //           topRight: Radius.circular(20),
  //         ),
  //         border: Border.all(
  //           color: Colors.grey.shade300,
  //           width: 1,
  //         ),
  //       ),
  //       // margin: EdgeInsets.only(right: index != null ? 16 : 0,
  //       //     left: index == 0 ? 16 : 0,
  //       //     bottom: 16),
  //       width: 220,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //           GestureDetector(
  //             onTap: () {
  //               // Navigator.push(
  //               //     context,
  //               //     PageRouteBuilder(
  //               //         pageBuilder: (context, a, b) =>
  //               //             DetailsOfNewBikes(value: item)));
  //             },
  //             child:
  //                 // Hero(
  //                 //   tag:cachorros?[index].image?.url?? carregarImagem,
  //                 //   child:
  //                 Container(
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: NetworkImage(
  //                     cachorros?[0].image?.url ?? carregarImagem,
  //                   ),
  //                   fit: BoxFit.cover,
  //                 ),
  //                 borderRadius: const BorderRadius.all(Radius.circular(10)),
  //               ),
  //             ),
  //             //  )
  //           ),
  //           // Expanded(
  //           //   child: Stack(
  //           //     children: [
  //
  //           // Hero(
  //           //   tag: cachorros?[index].image?.url?? carregarImagem,
  //           //   child:
  //           //   Container(
  //           //     decoration: BoxDecoration(
  //           //       image: DecorationImage(
  //           //         image: AssetImage(cachorros?[index].image?.url?? carregarImagem,),
  //           //         fit: BoxFit.cover,
  //           //       ),
  //           //       borderRadius: BorderRadius.only(
  //           //         topLeft: Radius.circular(20),
  //           //         topRight: Radius.circular(20),
  //           //       ),
  //           //     ),
  //           //   ),
  //           //   ),
  //
  //           // Align(
  //           //   alignment: Alignment.topRight,
  //           //   child: Padding(
  //           //     padding: EdgeInsets.all(12),
  //           //     child: Container(
  //           //       height: 30,
  //           //       width: 30,
  //           //       decoration: BoxDecoration(
  //           //         shape: BoxShape.circle,
  //           //        // color: pet.favorite ? Colors.red[400] : Colors.white,
  //           //       ),
  //           //       child: Icon(
  //           //         Icons.favorite,
  //           //         size: 16,
  //           //       //  color: pet.favorite ? Colors.white : Colors.grey[300],
  //           //       ),
  //           //     ),
  //           //   ),
  //           // ),
  //
  //           //     ],
  //           //   ),
  //           // ),
  //
  //           // Padding(
  //           //   padding: EdgeInsets.all(16),
  //           //   child: Column(
  //           //     crossAxisAlignment: CrossAxisAlignment.start,
  //           //     children: [
  //           //
  //           //       Container(
  //           //         decoration: BoxDecoration(
  //           //           //   color: pet.condition == "Adoption" ? Colors.orange[100] : pet.condition == "Disappear" ? Colors.red[100] : Colors.blue[100],
  //           //           borderRadius: BorderRadius.all(
  //           //             Radius.circular(10),
  //           //           ),
  //           //         ),
  //           //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //           //         child:
  //           //         Text(
  //           //           " pet.condition",
  //           //           style: TextStyle(
  //           //             //   color: pet.condition == "Adoption" ? Colors.orange : pet.condition == "Disappear" ? Colors.red : Colors.blue,
  //           //             fontWeight: FontWeight.bold,
  //           //             fontSize: 12,
  //           //           ),
  //           //         ),
  //           //       ),
  //           //
  //           //       SizedBox(
  //           //         height: 8,
  //           //       ),
  //           //
  //           //       Text(
  //           //         "pet.name",
  //           //         style: TextStyle(
  //           //           color: Colors.grey[800],
  //           //           fontSize: 18,
  //           //           fontWeight: FontWeight.bold,
  //           //         ),
  //           //       ),
  //           //
  //           //       SizedBox(
  //           //         height: 8,
  //           //       ),
  //           //
  //           //       Row(
  //           //         children: [
  //           //
  //           //           Icon(
  //           //             Icons.location_on,
  //           //             color: Colors.grey[600],
  //           //             size: 18,
  //           //           ),
  //           //
  //           //           SizedBox(
  //           //             width: 4,
  //           //           ),
  //           //
  //           //           Text(
  //           //            " pet.location",
  //           //             style: TextStyle(
  //           //               color: Colors.grey[600],
  //           //               fontSize: 12,
  //           //             ),
  //           //           ),
  //           //
  //           //           SizedBox(
  //           //             width: 4,
  //           //           ),
  //           //
  //           //           Text(
  //           //             "(aaa)",
  //           //             style: TextStyle(
  //           //               color: Colors.grey[600],
  //           //               fontSize: 12,
  //           //               fontWeight: FontWeight.bold,
  //           //             ),
  //           //           ),
  //           //
  //           //         ],
  //           //       ),
  //           //
  //           //     ],
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  List<Widget> _listaGatos() {
    return gatos!.map((GatoModel gato) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, a, b) =>
                        DetalhesGatoPage(gato:gato))

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
                        16,
                    //  : 0,
                    left: //index != null
                        // ?
                        16,
                    //  : 0,
                    bottom: 16),
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: [
                          Hero(
                            tag: gato.image?.url ?? carregarImagem,
                            child:

                                // Container(
                                //
                                //   decoration: BoxDecoration(
                                //     // image: DecorationImage(
                                //     //   image: NetworkImage(gato.image?.url??carregarImagem,),
                                //     //   fit: BoxFit.cover,
                                //     // ),
                                //     borderRadius: const BorderRadius.only(
                                //       topLeft: Radius.circular(20),
                                //       topRight: Radius.circular(20),
                                //     ),
                                //   ),
                                // child:
                                CachedNetworkImage(
                              imageUrl: gato.image?.url ?? carregarImagem,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                // width: 80.0,
                                // height: 80.0,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  // shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, i) =>
                                  const SpinKitFadingCircle(
                                      color: Colors.amber),
                              errorWidget: (context, i, error) =>
                                  Image.network(carregarImagem),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: //cachorro.origin
                                        //  ?
                                        Colors.red[400]
                                    //   :
                                    // Colors.white,
                                    ),
                                child: Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color:
                                      // pet.favorite
                                      //    ?
                                      // Colors.white
                                      //    :
                                      Colors.grey[300],
                                ),
                              ),
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
                            child: const Text(
                              "cachorro?.lifeSpan??",
                              style: TextStyle(
                                color:
                                    //    pet.condition == "Adoption" ?
                                    Colors.orange
                                // : pet.condition == "Disappear"
                                // ? Colors.red
                                // : Colors.blue
                                ,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "cachorro.name??",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey[600],
                                size: 18,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "cachorro?.temperament??",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "(pet.distancekm)",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )));
    }).toList();
  }

  // List<Widget> _listaCachorros3() {
  //   return gatos!.map(
  //
  //
  //
  //     (GatoModel gato) {
  //       return
  //         Padding(padding: const EdgeInsets.all(10),child:
  //         GestureDetector(
  //         onTap: () {
  //           // Navigator.push(
  //           //     context,
  //           //     PageRouteBuilder(
  //           //         pageBuilder: (context, a, b) =>
  //           //             DetailsOfNewBikes(value: item)));
  //         },
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(10.0),
  //           child: Align(
  //             alignment: Alignment.topCenter,
  //             child: Container(
  //                 constraints: const BoxConstraints(
  //                   minWidth: 15,
  //                   maxWidth: 400,
  //                   minHeight: 10,
  //                   maxHeight: 400,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: Colors.grey[200],
  //                   borderRadius: const BorderRadius.all(
  //                     Radius.circular(2.0),
  //                   ),
  //                 ),
  //                 // width: 200,
  //                 // height: 200,
  //                 child: Column(children: [
  //                   Expanded(
  //                       child: Container(
  //                     color: Colors.green,
  //                     child: Hero(
  //                       tag: gato.image?.url ?? carregarImagem,
  //                       child: CachedNetworkImage(
  //                         imageUrl:gato.image?.url ?? carregarImagem,
  //                         placeholder: (context, i) =>
  //                             const SpinKitFadingCircle(color: Colors.amber),
  //                         errorWidget: (context, i, error) =>
  //                             Image.network(carregarImagem),
  //                         memCacheWidth: 180,
  //                         memCacheHeight: 180,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                   )),
  //                   // Expanded(child:
  //                   // Container(color: Colors.white,)),
  //                   // Text(cachorros?[index].name??""),
  //                 ])),
  //           ),
  //         ),
  //         ),  );
  //     },
  //
  //
  //   ).toList();
  // }
  // List<Widget> _listaCachorros() {
  //   return cachorros!.map(
  //     (CachorroModel cachorro) {
  //       return
  //         Padding(padding: const EdgeInsets.all(10),child:
  //         GestureDetector(
  //         onTap: () {
  //           // Navigator.push(
  //           //     context,
  //           //     PageRouteBuilder(
  //           //         pageBuilder: (context, a, b) =>
  //           //             DetailsOfNewBikes(value: item)));
  //         },
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(10.0),
  //           child: Align(
  //             alignment: Alignment.topCenter,
  //             child: Container(
  //                 constraints: const BoxConstraints(
  //                   minWidth: 15,
  //                   maxWidth: 400,
  //                   minHeight: 10,
  //                   maxHeight: 400,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: Colors.grey[200],
  //                   borderRadius: const BorderRadius.all(
  //                     Radius.circular(2.0),
  //                   ),
  //                 ),
  //                 // width: 200,
  //                 // height: 200,
  //                 child: Column(children: [
  //                   Expanded(
  //                       child: Container(
  //                     color: Colors.green,
  //                     child: Hero(
  //                       tag: cachorro.image?.url ?? carregarImagem,
  //                       child: CachedNetworkImage(
  //                         imageUrl: cachorro.image?.url ?? carregarImagem,
  //                         placeholder: (context, i) =>
  //                             const SpinKitFadingCircle(color: Colors.amber),
  //                         errorWidget: (context, i, error) =>
  //                             Image.network(carregarImagem),
  //                         memCacheWidth: 180,
  //                         memCacheHeight: 180,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                   )),
  //                   // Expanded(child:
  //                   // Container(color: Colors.white,)),
  //                   // Text(cachorros?[index].name??""),
  //                 ])),
  //           ),
  //         ),
  //         ),  );
  //     },
  //   ).toList();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 100,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      color: Colors.grey,
      child:

          // GridView.builder(
          //   itemCount: cachorros?.length,
          //   itemBuilder: (context, index) =>

          Container(
        // height: 280,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children:
              //testelista(),
              _listaGatos(),
        ),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        // ),
      ),
    );
  }
}
