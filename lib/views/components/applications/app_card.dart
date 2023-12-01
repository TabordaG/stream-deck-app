import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mac_stream_deck/models/app_model.dart';
import 'package:flutter_mac_stream_deck/viewmodels/stream_deck_viewmodel.dart';

appCard({
  required AppModel appModel,
  required WebSocket channel,
  required StreamDeckViewModel streamDeckViewModel,
}) {
  return InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      streamDeckViewModel.sendMessage(channel, appModel.name);
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
              color: appModel.color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(appModel.asset),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 100,
          child: Text(
            appModel.name,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}
