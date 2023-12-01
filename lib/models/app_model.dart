// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppModel {
  String asset;
  String name;
  Color color;

  AppModel({
    required this.asset,
    required this.color,
    required this.name,
  });
}

List<String> appNameList = ['Spotify', 'Whatsapp', 'Visual Studio Code'];

List<AppModel> appList = [
  AppModel(
    asset: 'assets/spotify.png',
    color: Colors.black,
    name: 'Spotify',
  ),
  AppModel(
    asset: 'assets/whatsapp.png',
    color: const Color(0xFF00E777),
    name: 'Whatsapp',
  ),
  AppModel(
    asset: 'assets/vscode.png',
    color: Colors.white,
    name: 'Visual Studio Code',
  ),
];
