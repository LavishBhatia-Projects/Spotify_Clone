import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signin_userreq.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserreq signinUserreq);
  Future<Either> signup(
    Createuserreq createuserreq,
  );
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserreq signinUserreq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserreq.email, password: signinUserreq.password);
      return Right('Successfully Signed In');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else if (e.code == 'invalid-credential') {
        message = 'wrong password';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(Createuserreq createuserreq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createuserreq.email, password: createuserreq.password);
      return Right('Success');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }
}
