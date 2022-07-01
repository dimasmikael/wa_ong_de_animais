import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/detalhes-pet/detalhes-pet-widget.dart';
import 'package:projeto_pet_adoption_app/models/pet-model.dart';

class DetalhesPetPage extends StatelessWidget {
  const DetalhesPetPage({Key? key, required this.petModel}) : super(key: key);
  final PetModel petModel;

  @override
  Widget build(BuildContext context) {
    return DetalhesPetPageWiget(petModel: petModel);
  }
}
