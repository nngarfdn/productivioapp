import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/model/resource.dart';

class RemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  RemoteDataSource({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<Resource<User>> authenticate(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Return success with the authenticated user
      return Success(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Error('Wrong password provided.');
      } else {
        return Error('Authentication failed: ${e.message}');
      }
    } catch (e) {
      return Error('Unexpected error occurred.');
    }
  }
}