import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mac_stream_deck/viewmodels/stream_deck_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

slider({
  required WebSocket channel,
  required StreamDeckViewModel streamDeckViewModel,
}) {
  return Observer(builder: (_) {
    return Slider(
      activeColor: Colors.indigoAccent,
      min: 0.0,
      max: 7.0,
      divisions: 7,
      onChanged: (newRating) async {
        streamDeckViewModel.sendMessage(channel, newRating.toString());
      },
      value: streamDeckViewModel.sliderValue,
    );
  });
}
