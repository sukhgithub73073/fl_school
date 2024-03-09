part of 'role_bloc.dart';

abstract class RoleState extends Equatable {
  const RoleState();
}

class RoleInitial extends RoleState {
  @override
  List<Object> get props => [];
}

class RoleLoading extends RoleState {
  @override
  List<Object> get props => [];
}

class RolePrincipal extends RoleState {
  final ResponseModel responseModel;

  RolePrincipal({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class RoleTeacher extends RoleState {
  final ResponseModel responseModel;

  RoleTeacher({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}

class RoleStudent extends RoleState {
  final ResponseModel responseModel;

  RoleStudent({required this.responseModel});

  @override
  List<Object> get props => [responseModel];
}
