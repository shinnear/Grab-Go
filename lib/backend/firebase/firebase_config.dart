import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC48Tm-ELrdFW81TAN73MdvLQUc-1_n9R0",
            authDomain: "grab-and-go-7i4eqy.firebaseapp.com",
            projectId: "grab-and-go-7i4eqy",
            storageBucket: "grab-and-go-7i4eqy.firebasestorage.app",
            messagingSenderId: "553485446477",
            appId: "1:553485446477:web:7dd100e7067153b98ddb04"));
  } else {
    await Firebase.initializeApp();
  }
}
