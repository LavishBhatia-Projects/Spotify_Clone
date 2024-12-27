import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signin_userreq.dart';
import 'package:spotify_clone/domain/repositories/auth/auth.dart';
import 'package:spotify_clone/servicelocator.dart';

import '../../../data/models/auth/createuserreq.dart';
import 'package:dartz/dartz.dart';

class Signinusecase implements Usecase<Either, SigninUserreq> {
  @override
  Future<Either> call({SigninUserreq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
