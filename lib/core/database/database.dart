import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Database {
  Future<void> initializeParse() async {
    await Parse().initialize(
      'szKisR9st4RV0bHtsLFjcutgAZ5wf5wBgdIuD5TP',
      'https://parseapi.back4app.com',
      clientKey: 'ycc9bXNyrhCqinGNx4YCLioNgDK256SAg0EK9l97',
      debug: true,
      autoSendSessionId: true,
    );
  }
}
