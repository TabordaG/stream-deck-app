// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_deck_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StreamDeckViewModel on StreamDeckViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'StreamDeckViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$sliderValueAtom =
      Atom(name: 'StreamDeckViewModelBase.sliderValue', context: context);

  @override
  double get sliderValue {
    _$sliderValueAtom.reportRead();
    return super.sliderValue;
  }

  @override
  set sliderValue(double value) {
    _$sliderValueAtom.reportWrite(value, super.sliderValue, () {
      super.sliderValue = value;
    });
  }

  late final _$musicActionsAtom =
      Atom(name: 'StreamDeckViewModelBase.musicActions', context: context);

  @override
  List<String> get musicActions {
    _$musicActionsAtom.reportRead();
    return super.musicActions;
  }

  @override
  set musicActions(List<String> value) {
    _$musicActionsAtom.reportWrite(value, super.musicActions, () {
      super.musicActions = value;
    });
  }

  late final _$flutterChannelAtom =
      Atom(name: 'StreamDeckViewModelBase.flutterChannel', context: context);

  @override
  MethodChannel get flutterChannel {
    _$flutterChannelAtom.reportRead();
    return super.flutterChannel;
  }

  @override
  set flutterChannel(MethodChannel value) {
    _$flutterChannelAtom.reportWrite(value, super.flutterChannel, () {
      super.flutterChannel = value;
    });
  }

  late final _$openAppAsyncAction =
      AsyncAction('StreamDeckViewModelBase.openApp', context: context);

  @override
  Future<void> openApp(String name) {
    return _$openAppAsyncAction.run(() => super.openApp(name));
  }

  late final _$changeVolumeAsyncAction =
      AsyncAction('StreamDeckViewModelBase.changeVolume', context: context);

  @override
  Future<void> changeVolume(double value) {
    return _$changeVolumeAsyncAction.run(() => super.changeVolume(value));
  }

  late final _$changeMusicAsyncAction =
      AsyncAction('StreamDeckViewModelBase.changeMusic', context: context);

  @override
  Future<void> changeMusic(String action) {
    return _$changeMusicAsyncAction.run(() => super.changeMusic(action));
  }

  late final _$playSoundsEffectsAsyncAction = AsyncAction(
      'StreamDeckViewModelBase.playSoundsEffects',
      context: context);

  @override
  Future<void> playSoundsEffects(String name) {
    return _$playSoundsEffectsAsyncAction
        .run(() => super.playSoundsEffects(name));
  }

  late final _$StreamDeckViewModelBaseActionController =
      ActionController(name: 'StreamDeckViewModelBase', context: context);

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$StreamDeckViewModelBaseActionController.startAction(
        name: 'StreamDeckViewModelBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$StreamDeckViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSliderValue(double value) {
    final _$actionInfo = _$StreamDeckViewModelBaseActionController.startAction(
        name: 'StreamDeckViewModelBase.setSliderValue');
    try {
      return super.setSliderValue(value);
    } finally {
      _$StreamDeckViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic executeCommand(String command) {
    final _$actionInfo = _$StreamDeckViewModelBaseActionController.startAction(
        name: 'StreamDeckViewModelBase.executeCommand');
    try {
      return super.executeCommand(command);
    } finally {
      _$StreamDeckViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
sliderValue: ${sliderValue},
musicActions: ${musicActions},
flutterChannel: ${flutterChannel}
    ''';
  }
}
