import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/enums/role_enum.dart';
import 'package:fl_school/src/utility/app_util.dart';

part 'role_event.dart';

part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc() : super(RoleInitial()) {
    on<ChangeRoleEvent>(_doChangeRole);
    on<UpdateRoleEventData>(_updateRoleData);
  }

  FutureOr<void> _doChangeRole(ChangeRoleEvent event, Emitter<RoleState> emit) {
    emit(RoleLoading());
    if (event.roleEnum == RoleEnum.principle) {
      emit(RolePrincipal(responseModel: ResponseModel()));
    } else if (event.roleEnum == RoleEnum.teacher) {
      emit(RoleTeacher(responseModel: ResponseModel()));
    } else {
      emit(RoleStudent(responseModel: ResponseModel()));
    }
  }

  FutureOr<void> _updateRoleData(UpdateRoleEventData event, Emitter<RoleState> emit) {
    printLog(">>>>>>>>>>>>>>>>>>>") ;
    try {
      emit(RoleLoading());
      if (event.roleEnum == RoleEnum.principle) {
            emit(RolePrincipal(responseModel: event.responseModel));
          } else if (event.roleEnum == RoleEnum.teacher) {
            emit(RoleTeacher(responseModel: event.responseModel));
          } else {
            emit(RoleStudent(responseModel: event.responseModel));
          }
    } catch (e) {
      printLog(">>>>>>>>>>>>>>>Exception>$e");

    }
  }
}
