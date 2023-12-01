import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mac_stream_deck/models/sound_effect_model.dart';
import 'package:flutter_mac_stream_deck/viewmodels/stream_deck_viewmodel.dart';

soundEffectCard({
  required SoundEffectModel soundEffect,
  required WebSocket channel,
  required StreamDeckViewModel streamDeckViewModel,
}) {
  return InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      streamDeckViewModel.sendMessage(channel, soundEffect.name);
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 8,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: soundEffect.color,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.music_note_rounded),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 100,
          child: Text(
            soundEffect.title,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}
