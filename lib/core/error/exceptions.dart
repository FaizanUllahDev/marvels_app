import 'package:equatable/equatable.dart';

class ServerException implements Exception {}

abstract class CustomException extends Equatable implements Exception {
  final String message;

  const CustomException({required this.message});

  @override
  List<Object?> get props => [message];
}

class GeneralException extends CustomException {
  const GeneralException({required super.message});
}
