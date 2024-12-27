import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signin_userreq.dart';

abstract class AuthRepository {
  Future<Either> signup(Createuserreq createuserreq);
  Future<Either> signin(SigninUserreq signinUserreq);
}
