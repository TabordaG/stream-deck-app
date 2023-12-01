import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_mac_stream_deck/models/app_model.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'stream_deck_viewmodel.g.dart';

// This is the class used by rest of your codebase
class StreamDeckViewModel = StreamDeckViewModelBase with _$StreamDeckViewModel;

// The store-class
abstract class StreamDeckViewModelBase with Store {
  @observable
  bool isLoading = true;

  @observable
  double sliderValue = 0.0;

  @observable
  List<String> musicActions = [
    'previous track',
    'playpause',
    'playpause',
    'stop',
    'next track',
  ];

  @observable
  MethodChannel flutterChannel = const MethodChannel('mac.stream.deck');

  @action
  setIsLoading(bool value) => isLoading = value;

  @action
  setSliderValue(double value) => sliderValue = value;

  @action
  executeCommand(String command) {
    if (double.tryParse(command) != null) {
      // Se o aparelho não for um Macbook, poderá apenas executar o ajuste do
      // Widget de Slider
      setSliderValue(double.parse(command));

      if (!Platform.isMacOS) return;
      changeVolume(double.parse(command));
      return;
    }

    if (!Platform.isMacOS) return;

    if (appNameList.contains(command)) {
      openApp(command);
      return;
    }

    if (musicActions.contains(command)) {
      changeMusic(command);
      return;
    }

    playSoundsEffects(command);
  }

  @action
  Future<void> openApp(String name) async {
    final arguments = {'name': name};
    await flutterChannel.invokeMethod('openApp', arguments);
    Logger().d(flutterChannel.toString());
  }

  @action
  Future<void> changeVolume(double value) async {
    final arguments = {'value': value.toInt()};
    await flutterChannel.invokeMethod('changeVolume', arguments);
  }

  @action
  Future<void> changeMusic(String action) async {
    final arguments = {'action': action};
    await flutterChannel.invokeMethod('changeMusic', arguments);
  }

  @action
  Future<void> playSoundsEffects(String name) async {
    final arguments = {'sounds_effect': name};
    await flutterChannel.invokeMethod('soundsEffect', arguments);
  }

  @action
  sendMessage(WebSocket channel, String msg) {
    channel.add(msg);
  }
}
