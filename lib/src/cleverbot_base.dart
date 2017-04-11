// Copyright (c) 2017, 'rinukkusu'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of cleverbot;

abstract class CleverbotBase {
  static const String _baseUrl = 'https://www.cleverbot.com/getreply';
  String _getUrl(String message) =>
      '${_baseUrl}?key=${_apiToken}&cs=${_conversationCtx}&input=${Uri.encodeQueryComponent(message)}';
  final String _apiToken;
  String _conversationCtx = "";

  CleverbotBase(this._apiToken);

  Future<String> think(String message) async {
    var json = await _thinkImpl(message);

    var decoded = JSON.decode(json) as Map<String, dynamic>;

    _conversationCtx = decoded["cs"] as String;

    return decoded["clever_output"] as String;
  }

  Future<String> _thinkImpl(String message);
}
