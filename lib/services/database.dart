import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini/models/userr.dart';

class Databaseservices {
  final String uid;
  Databaseservices({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference hospitalCollection =
      FirebaseFirestore.instance.collection('hospital');
      final CollectionReference plasmaCollection = FirebaseFirestore.instance.collection('plasma');

  Future updateUserData(String name, String email, String address, String phone,
      String blood) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'blood': blood,
    });
  }

  Userdata _personDataSnapshot(DocumentSnapshot snapshot) {
    return Userdata(
      uid: uid,
      name: snapshot.data()['name'],
      email: snapshot.data()['email'],
      phone: snapshot.data()['phone'],
      address: snapshot.data()['address'],
      blood: snapshot.data()['blood'],
    );
  }

  Stream<Userdata> get userData {
    return userCollection.doc(uid).snapshots().map(_personDataSnapshot);
  }
}
