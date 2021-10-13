import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'errors/failures.dart';

abstract class Usecase<Output, Input> {
  // <Failure, Output> Falha e Sucesso

  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
