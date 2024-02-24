part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginSuccess extends LoginState {
  final ResponseModel responseModel;
  LoginSuccess({required this.responseModel});
  @override
  List<Object> get props => [responseModel];
}
class LoginError extends LoginState {
  final String error ;
  LoginError({required this.error});
  @override
  List<Object> get props => [error];
}