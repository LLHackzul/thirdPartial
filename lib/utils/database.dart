import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('conferencias');


class Database {
  static Future<void> addConference({
    required String title,
    required String speaker,
    required String area,
    required String date,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "speaker": speaker,
      "area": area,
      "date": date,
    };

    await documentReferencer
        .set(data, )
        .whenComplete(() => print("la conferencia se añadió"))
        .catchError((e) => print(e));
  }

  static Future<void> updateConference({
    required String title,
    required String speaker,
    required String area,
    required String date,
    required String docId,
  }) async {
    DocumentReference documentReference = _mainCollection.doc(docId);
    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "speaker": speaker,
      "area": area,
      "date": date,
    };
    await documentReference
        .update(data)
        .whenComplete(() => print('La conferencia se actualizó'))
        .catchError((error) => print(error));
  }

  static Future<void> deleteConference({
    required String docId,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('La conferencia se eliminó'))
        .catchError((e) => print(e));
  }
}
