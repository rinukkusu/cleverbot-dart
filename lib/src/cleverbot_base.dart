// Copyright (c) 2017, 'rinukkusu'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of cleverbot;

abstract class CleverbotBase {
  final bool _debug;
  final String _apiToken;

  static RegExp _outputRegex = new RegExp(r'"clever_output":\s?"(.+?)"');
  static RegExp _csRegex = new RegExp(r'"cs":\s?"(.+?)"');

  static const String _baseUrl = 'https://www.cleverbot.com/getreply';
  String _getUrl(String message) =>
      '${_baseUrl}?key=${_apiToken}&cs=${_conversationCtx}&wrapper=cleverbot-dart&input=${Uri.encodeQueryComponent(message)}';
  String _conversationCtx = "";

  CleverbotBase(this._apiToken, this._debug);

  Future<String> think(String message) async {
    var bytes = await _thinkImpl(message);

    var decoded = UTF8.decode(bytes, allowMalformed: true);
    try {
      _conversationCtx = _csRegex.firstMatch(decoded).group(1);
      return _outputRegex.firstMatch(decoded).group(1);
    } catch (error) {
      print("================= Error =======================");
      print(bytes);
      print("===============================================");
      rethrow;
    }
  }

  Future<List<int>> _thinkImpl(String message);
}
