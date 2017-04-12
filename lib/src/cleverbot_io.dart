// Copyright (c) 2017, 'rinukkusu'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of cleverbot;

class Cleverbot extends CleverbotBase {
  Cleverbot(String apiToken, {bool debug = false}) : super(apiToken, debug);

  Future<List<int>> _thinkImpl(String message) async {
    var client = new http.Client();
    var response = await client.get(_getUrl(message));
    return response.bodyBytes;
  }
}
