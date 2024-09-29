import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDbJVvNVU1fFqPt8w6_4Qt4UmbjWVpWA4U",
            authDomain: "financi-o-app-lsrf2o.firebaseapp.com",
            projectId: "financi-o-app-lsrf2o",
            storageBucket: "financi-o-app-lsrf2o.appspot.com",
            messagingSenderId: "521520622441",
            appId: "1:521520622441:web:4f293c0f7d5af687146bf8"));
  } else {
    await Firebase.initializeApp();
  }
}
