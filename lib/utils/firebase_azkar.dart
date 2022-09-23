import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvvm_islami_app/model/azkar/azkar_model.dart';

CollectionReference<AzkarModel> getCollection() {
  return FirebaseFirestore.instance.collection('azkary').withConverter(
      fromFirestore: (snapshot, _) => AzkarModel.fromJson(snapshot.data()!),
      toFirestore: (azkarModel, _) => azkarModel.toJson());
}

Future<void> addNewZekr(AzkarModel azkarModel) async {
  var collection = await getCollection();
  var doc = collection.doc();
  azkarModel.id = doc.id;
  return doc.set(azkarModel);
}

Stream<QuerySnapshot<AzkarModel>> displayAllAzkar() {
  var collection = getCollection();
  return collection.snapshots();
}

Future<QuerySnapshot<AzkarModel>> getZekr() async {
  var collection = getCollection();
  return await collection.get();
}

Future<void> removeFromFireBase(AzkarModel azkarModel) async {
  var collection = await getCollection();
  return collection.doc(azkarModel.id).delete();
}
