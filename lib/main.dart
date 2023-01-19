import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:squad/config.dart';
import 'package:squad/views/app/view/app_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Facebook App Initialization
  if (kIsWeb) {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: Config.facebookAppId,
      cookie: true,
      xfbml: true,
      version: Config.facebookVersionNumber,
    );
  }

  runApp(App());
}
