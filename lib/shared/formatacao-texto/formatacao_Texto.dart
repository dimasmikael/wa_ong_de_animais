import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';


Widget textoAppBar(String texto) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      texto,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
        fontSize: SizeConfig.safeBlockHorizontal! * 6,
      ),
    ),
  );
}

Widget textoHomeCategoria(String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 5, bottom: 8),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          fontSize: SizeConfig.safeBlockHorizontal! * 6,
        ),
      ),
    ),
  );
}

Widget textoListagemNomePet(String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 1, top: 1, bottom: 1),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          //  color: Colors.grey[800],
          fontSize: SizeConfig.safeBlockHorizontal! * 4.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget textoListagemOrigemPet(String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 1, top: 1, bottom: 1),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          fontSize: SizeConfig.safeBlockHorizontal! * 3,
        ),
      ),
    ),
  );
}

Widget textoListagemVidaUtilPet(String texto) {
  return Text(
    texto,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.inter(
      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
    ),
  );
}

Widget textoDetalhePetNome(String texto) {
  return Text(
    texto,
    maxLines: 1,
    style: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.safeBlockHorizontal! * 6,
    ),
  );
}

Widget textoDetalhePetOrigem(String texto) {
  return Text(
    texto,
    maxLines: 1,
    style: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.safeBlockHorizontal! * 4,
    ),
  );
}

Widget textoDetalhePetInfo(String texto) {
  return Text(
    texto,
    maxLines: 1,
    style: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.safeBlockHorizontal! * 3.4,
    ),
  );
}

Widget textoDetalhePetInfoTitulo(String texto) {
  return Text(
    texto,
    maxLines: 1,
    style: GoogleFonts.inter(
      fontSize: SizeConfig.safeBlockHorizontal! * 3.8,
    ),
  );
}

Widget textoTabelaPetRow(String texto) {
  return Padding(
    padding: const EdgeInsets.all(1),
    child: Text(
      texto,
      maxLines: 1,
      style: GoogleFonts.inter(
        fontSize: SizeConfig.safeBlockHorizontal! * 4,
      ),
    ),
  );
}

Widget textoDetalhePetInformation(String texto) {
  return
    Padding(
      padding: EdgeInsets.only(top: 10,bottom: 10,left: 20),child:

    Text(
    texto,
    maxLines: 1,
    style: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.safeBlockHorizontal! * 6,

    ), ),
  );
}