import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mac_stream_deck/models/sound_effect_model.dart';
import 'package:flutter_mac_stream_deck/viewmodels/stream_deck_viewmodel.dart';

import 'sound_effect_card.dart';

soundEffectsSection({
  required WebSocket channel,
  required StreamDeckViewModel streamDeckViewModel,
}) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 60,
          child: Center(
            child: Text(
              'Efeitos Sonoros',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          children: List.generate(soundEffectList.length, (index) {
            return soundEffectCard(
              channel: channel,
              soundEffect: soundEffectList[index],
              streamDeckViewModel: streamDeckViewModel,
            );
          }),
        ),
      ],
    ),
  );
}
