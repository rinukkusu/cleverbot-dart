// Copyright (c) 2017, 'rinukkusu'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of cleverbot;

class Cleverbot extends CleverbotBase {
  Cleverbot(String apiToken) : super(apiToken);

  Future<String> think(String message) async {
    var client = new http.BrowserClient();
    var response = await client.get(_getUrl(message));
    var bytes = response.bodyBytes;
    var json = UTF8.decode(bytes);
    var decoded = JSON.decode(json);

    _conversationCtx = decoded["cs"] as String;

    return decoded["clever_output"] as String;
  }
}
