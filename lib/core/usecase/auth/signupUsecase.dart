import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/domain/repositories/auth/auth.dart';
import 'package:spotify_clone/servicelocator.dart';

import '../../../data/models/auth/createuserreq.dart';
import 'package:dartz/dartz.dart';

class Signupusecase implements Usecase<Either, Createuserreq> {
  @override
  Future<Either> call({Createuserreq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
