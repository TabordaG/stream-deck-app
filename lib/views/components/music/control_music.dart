import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mac_stream_deck/viewmodels/stream_deck_viewmodel.dart';

controlMusic({
  required WebSocket channel,
  required StreamDeckViewModel streamDeckViewModel,
}) {
  return Wrap(
    alignment: WrapAlignment.center,
    children: [
      IconButton(
        onPressed: () {
          streamDeckViewModel.sendMessage(channel, 'previous track');
        },
        icon: const Icon(Icons.skip_previous_rounded),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          streamDeckViewModel.sendMessage(channel, 'playpause');
        },
        icon: const Icon(Icons.pause),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          streamDeckViewModel.sendMessage(channel, 'playpause');
        },
        icon: const Icon(Icons.play_arrow_rounded),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          streamDeckViewModel.sendMessage(channel, 'stop');
        },
        icon: const Icon(Icons.stop_rounded),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          streamDeckViewModel.sendMessage(channel, 'next track');
        },
        icon: const Icon(Icons.skip_next_rounded),
      ),
    ],
  );
}
