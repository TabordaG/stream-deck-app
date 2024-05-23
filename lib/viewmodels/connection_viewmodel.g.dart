// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionViewModel on ConnectionViewModelBase, Store {
  late final _$channelWebSocketAtom =
      Atom(name: 'ConnectionViewModelBase.channelWebSocket', context: context);

  @override
  WebSocket? get channelWebSocket {
    _$channelWebSocketAtom.reportRead();
    return super.channelWebSocket;
  }

  @override
  set channelWebSocket(WebSocket? value) {
    _$channelWebSocketAtom.reportWrite(value, super.channelWebSocket, () {
      super.channelWebSocket = value;
    });
  }

  late final _$syncInternetWebSocketAsyncAction = AsyncAction(
      'ConnectionViewModelBase.syncInternetWebSocket',
      context: context);

  @override
  Future syncInternetWebSocket({bool hideLoading = false}) {
    return _$syncInternetWebSocketAsyncAction
        .run(() => super.syncInternetWebSocket(hideLoading: hideLoading));
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('ConnectionViewModelBase.sendMessage', context: context);

  @override
  Future sendMessage(String msg) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(msg));
  }

  late final _$ConnectionViewModelBaseActionController =
      ActionController(name: 'ConnectionViewModelBase', context: context);

  @override
  dynamic closeConnection() {
    final _$actionInfo = _$ConnectionViewModelBaseActionController.startAction(
        name: 'ConnectionViewModelBase.closeConnection');
    try {
      return super.closeConnection();
    } finally {
      _$ConnectionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic syncLocalNetworkConnection() {
    final _$actionInfo = _$ConnectionViewModelBaseActionController.startAction(
        name: 'ConnectionViewModelBase.syncLocalNetworkConnection');
    try {
      return super.syncLocalNetworkConnection();
    } finally {
      _$ConnectionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic listenForLocalNetworkMessages() {
    final _$actionInfo = _$ConnectionViewModelBaseActionController.startAction(
        name: 'ConnectionViewModelBase.listenForLocalNetworkMessages');
    try {
      return super.listenForLocalNetworkMessages();
    } finally {
      _$ConnectionViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
channelWebSocket: ${channelWebSocket}
    ''';
  }
}
