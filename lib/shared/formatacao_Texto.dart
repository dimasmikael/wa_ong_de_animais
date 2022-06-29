import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetos/components/size-config/size-config.dart';
import 'package:projetos/main.dart';
import 'package:projetos/shared/theme/theme_manager.dart';

Widget textoAppBar(String texto) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      texto,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
        fontSize: SizeConfig.safeBlockHorizontal! * 6,
        // color: themeManager.themeMode == ThemeMode.dark
        //     ? ThemeData.dark().textTheme.bodyText1!.color
        //     : ThemeData.light().textTheme.bodyText1!.color,
      ),
    ),
  );
}

Widget textoHomeCategoria(String texto) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 1, bottom: 5),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          fontSize: SizeConfig.safeBlockHorizontal! * 4,
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
          color: Colors.grey[800],
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
          color: Colors.grey[600],
          fontSize: SizeConfig.safeBlockHorizontal! * 3,
        ),
      ),
    ),
  );
}
