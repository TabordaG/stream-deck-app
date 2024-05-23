import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../viewmodels/viewmodels.dart';

import 'sound_effect_card.dart';

soundEffectsSection({required ConnectionViewModel connectionViewModel}) {
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
              soundEffect: soundEffectList[index],
              connectionViewModel: connectionViewModel,
            );
          }),
        ),
      ],
    ),
  );
}
