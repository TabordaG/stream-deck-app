import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mac_stream_deck/viewmodels/stream_deck_viewmodel.dart';
import 'package:flutter_mac_stream_deck/views/components/applications/app_section.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logger/logger.dart';

import 'components/music/control_music.dart';
import 'components/music/slider.dart';
import 'components/soundEffect/sound_effect_section.dart';

class StreamDeckView extends StatefulWidget {
  const StreamDeckView({super.key});

  @override
  State<StreamDeckView> createState() => _StreamDeckViewState();
}

class _StreamDeckViewState extends State<StreamDeckView> {
  final StreamDeckViewModel streamDeckViewModel = StreamDeckViewModel();
  late WebSocket _channel;

  @override
  void initState() {
    super.initState();
    syncWebSocket();
  }

  @override
  void dispose() {
    _channel.close();
    super.dispose();
  }

  syncWebSocket() async {
    _channel = await WebSocket.connect('ws://0.tcp.sa.ngrok.io:15608');
    _channel.pingInterval = const Duration(seconds: 5);

    _channel.listen((data) {
      Logger().i(data);

      String command = data.toString().replaceFirst('echo ', '');
      streamDeckViewModel.executeCommand(command);
    });

    streamDeckViewModel.setIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (streamDeckViewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return _content();
      }),
    );
  }

  _content() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appsSection(
                    channel: _channel,
                    streamDeckViewModel: streamDeckViewModel,
                  ),
                  const SizedBox(width: 16),
                  soundEffectsSection(
                    channel: _channel,
                    streamDeckViewModel: streamDeckViewModel,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Música',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              slider(
                channel: _channel,
                streamDeckViewModel: streamDeckViewModel,
              ),
              const SizedBox(height: 16),
              controlMusic(
                channel: _channel,
                streamDeckViewModel: streamDeckViewModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
