import 'package:flutter/material.dart';

class SoundEffectModel {
  String title;
  String name;
  Color color;

  SoundEffectModel({
    required this.title,
    required this.color,
    required this.name,
  });
}

List<SoundEffectModel> soundEffectList = [
  SoundEffectModel(
    title: 'Teams',
    color: const Color.fromARGB(255, 11, 42, 12),
    name: 'teams',
  ),
  SoundEffectModel(
    title: 'Spiderman',
    color: const Color.fromARGB(255, 68, 16, 16),
    name: 'spiderman-meme-song',
  ),
  SoundEffectModel(
    title: 'Pix',
    color: const Color.fromARGB(255, 95, 44, 7),
    name: 'e-o-pix-nada-ainda',
  ),
  SoundEffectModel(
    title: 'Gol',
    color: const Color.fromARGB(255, 11, 28, 54),
    name: 'beligol-beligol',
  ),
];
