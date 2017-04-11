// Copyright (c) 2017, 'rinukkusu'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of cleverbot;

abstract class CleverbotBase {
  static const String _baseUrl = 'https://www.cleverbot.com/getreply';
  String _getUrl(String message) =>
      '${_baseUrl}?key=${_apiToken}&cs=${_conversationCtx}&input={$message}';
  final String _apiToken;
  String _conversationCtx = "";

  CleverbotBase(this._apiToken);

  Future<String> think(String message) async {
    var bytes = await _thinkImpl(message);
    String json;

    if (utf.hasUtf16Bom(bytes))
      json = utf.decodeUtf16(bytes);
    else if (utf.hasUtf16beBom(bytes))
      json = utf.decodeUtf16be(bytes);
    else if (utf.hasUtf16leBom(bytes))
      json = utf.decodeUtf16le(bytes);
    else if (utf.hasUtf32Bom(bytes))
      json = utf.decodeUtf32(bytes);
    else if (utf.hasUtf32beBom(bytes))
      json = utf.decodeUtf32be(bytes);
    else if (utf.hasUtf32leBom(bytes))
      json = utf.decodeUtf32le(bytes);
    else
      json = utf.decodeUtf8(bytes);
      
    var decoded = JSON.decode(json) as Map<String, dynamic>;

    _conversationCtx = decoded["cs"] as String;

    return decoded["clever_output"] as String;
  }

  Future<Uint8List> _thinkImpl(String message);
}
