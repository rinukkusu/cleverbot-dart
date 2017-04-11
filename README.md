# cleverbot

A library for interacting with cleverbot.

## Usage

Get your API key at [The official Cleverbot API][cleverbot-api] site.

A simple usage example:

```dart
import 'package:cleverbot/cleverbot.dart';

main() async {
  var cleverbot = new Cleverbot("<YOUR APIKEY HERE>");
  var result = await cleverbot.think('Hello Cleverbot!');
  print(result);
}
```

For usage in the browser just import `cleverbot_browser.dart`:

```dart
import 'package:cleverbot/cleverbot_browser.dart';
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/rinukkusu/cleverbot-dart/issues
[cleverbot-api]: http://www.cleverbot.com/api/