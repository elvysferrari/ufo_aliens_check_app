import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp(
  name: "ufo-aliens-check-app",
  options: DefaultFirebaseOptions.currentPlatform,
);
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;