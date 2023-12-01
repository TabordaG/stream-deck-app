import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mac_stream_deck/models/app_model.dart';
import 'package:flutter_mac_stream_deck/viewmodels/stream_deck_viewmodel.dart';

import 'app_card.dart';

appsSection({
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
              'Aplicativos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          children: List.generate(appList.length, (index) {
            return appCard(
              appModel: appList[index],
              channel: channel,
              streamDeckViewModel: streamDeckViewModel,
            );
          }),
        ),
      ],
    ),
  );
}
