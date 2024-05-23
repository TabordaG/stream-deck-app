import 'package:flutter/material.dart';

import '../../../viewmodels/viewmodels.dart';

controlMusic({required ConnectionViewModel connectionViewModel}) {
  return Wrap(
    alignment: WrapAlignment.center,
    children: [
      IconButton(
        onPressed: () {
          connectionViewModel.sendMessage('previous track');
        },
        icon: const Icon(Icons.skip_previous_rounded),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          connectionViewModel.sendMessage('playpause');
        },
        icon: const Icon(Icons.pause),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          connectionViewModel.sendMessage('playpause');
        },
        icon: const Icon(Icons.play_arrow_rounded),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          connectionViewModel.sendMessage('stop');
        },
        icon: const Icon(Icons.stop_rounded),
      ),
      const SizedBox(width: 16),
      IconButton(
        onPressed: () {
          connectionViewModel.sendMessage('next track');
        },
        icon: const Icon(Icons.skip_next_rounded),
      ),
    ],
  );
}
