import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseFireStoreProvider =
    Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);
