import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
}

final class UnknownAuthState extends AuthState {
  @override
  List<Object?> get props => [];

}

final class AuthenticatedAuthState extends AuthState {
  @override
  List<Object?> get props => [];

}

final class UnauthorizedAuthState extends AuthState {
  @override
  List<Object?> get props => [];

}