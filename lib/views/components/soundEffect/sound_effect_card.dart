import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../viewmodels/viewmodels.dart';

soundEffectCard({
  required SoundEffectModel soundEffect,
  required ConnectionViewModel connectionViewModel,
}) {
  return InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      connectionViewModel.sendMessage(soundEffect.name);
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
