import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signin_userreq.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase.dart';
import 'package:spotify_clone/domain/repositories/auth/auth.dart';
import 'package:spotify_clone/servicelocator.dart';

class AuthRepoImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserreq signinUserreq) async {
    return await sl<AuthFirebaseService>().signin(signinUserreq);
  }

  @override
  Future<Either> signup(Createuserreq createuserreq) async {
    return await sl<AuthFirebaseService>().signup(createuserreq);
  }
}
