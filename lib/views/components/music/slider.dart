import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../viewmodels/viewmodels.dart';

slider({
  required ConnectionViewModel connectionViewModel,
  required StreamDeckViewModel streamDeckViewModel,
}) {
  return Observer(builder: (_) {
    return Slider(
      activeColor: Colors.indigoAccent,
      min: 0.0,
      max: 7.0,
      divisions: 7,
      onChanged: (newRating) async {
        streamDeckViewModel.setSliderValue(value: newRating);
        connectionViewModel.sendMessage(newRating.toString());
      },
      value: streamDeckViewModel.sliderValue,
    );
  });
}
