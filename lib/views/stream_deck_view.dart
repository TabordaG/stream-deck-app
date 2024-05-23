import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../viewmodels/viewmodels.dart';
import 'components/applications/app_section.dart';
import 'components/music/control_music.dart';
import 'components/music/slider.dart';
import 'components/soundEffect/sound_effect_section.dart';

class StreamDeckView extends StatefulWidget {
  const StreamDeckView({super.key});

  @override
  State<StreamDeckView> createState() => _StreamDeckViewState();
}

class _StreamDeckViewState extends State<StreamDeckView> {
  final StreamDeckViewModel streamDeckViewModel =
      GetIt.I<StreamDeckViewModel>();
  final ConnectionViewModel connectionViewModel =
      GetIt.I<ConnectionViewModel>();

  @override
  void initState() {
    super.initState();
    connectionViewModel
        .syncInternetWebSocket()
        .then((value) => connectionViewModel.syncLocalNetworkConnection());
  }

  @override
  void dispose() {
    connectionViewModel.closeConnection();
    super.dispose();
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
                  appsSection(connectionViewModel: connectionViewModel),
                  const SizedBox(width: 16),
                  soundEffectsSection(connectionViewModel: connectionViewModel),
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
                streamDeckViewModel: streamDeckViewModel,
                connectionViewModel: connectionViewModel,
              ),
              const SizedBox(height: 16),
              controlMusic(connectionViewModel: connectionViewModel),
            ],
          ),
        ),
      ),
    );
  }
}
