// Package imports:
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

final firebaseFunctions = Provider((ref) => FirebaseFunctions.instance);
final firebaseAuth = Provider((ref) => FirebaseAuth.instance);
