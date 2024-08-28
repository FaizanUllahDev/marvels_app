import 'package:dartz/dartz.dart';
import 'package:test_app_marvels/core/error/exceptions.dart';

typedef ResultMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<ServerException, T>>;
typedef ResultVoid = Future<Either<ServerException, void>>;
