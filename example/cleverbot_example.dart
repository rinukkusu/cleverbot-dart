// Copyright (c) 2017, 'rinukkusu'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:cleverbot/cleverbot.dart';

main() async {
  var cleverbot = new Cleverbot("0123456789ABCDEF");
  var result = await cleverbot.think('Hello Cleverbot!');
  print(result);
}
