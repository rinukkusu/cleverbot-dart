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

  Future<String> think(String message);
}
