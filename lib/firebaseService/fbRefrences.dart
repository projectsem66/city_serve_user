import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference refCategory =
    FirebaseFirestore.instance.collection('category');
final CollectionReference refSubCategory =
    FirebaseFirestore.instance.collection('providerDetails');
final CollectionReference refServices =
    FirebaseFirestore.instance.collection('providerServiceDetails');
