# cleverbot

A library for interacting with cleverbot.

## Usage

A simple usage example:

```dart
import 'package:cleverbot/cleverbot.dart';

main() async {
  var cleverbot = new Cleverbot("0123456789ABCDEF");
  var result = await cleverbot.think('Hello Cleverbot!');
  print(result);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/rinukkusu/cleverbot-dart/issues
