import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/api_status_code.dart';
import 'package:fl_school/src/data/repository/teacher_repo.dart';

import 'package:get_it/get_it.dart';

part 'teacher_event.dart';

part 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  var teacherRepository = GetIt.I<TeacherRepository>();

  TeacherBloc() : super(TeacherInitial()) {
    on<GetTeacherEvent>(_getTeacherApi);
    on<CreateTeacherEvent>(_createTeacherApi);
  }

  Future<FutureOr<void>> _getTeacherApi(
      GetTeacherEvent event, Emitter<TeacherState> emit) async {
    try {
      emit(TeacherGetLoading());
      var responseModel = await teacherRepository.getTeacherApi(event.map);
      emit(TeacherGetLoadingDismiss());
      emit(TeacherGetSuccess(responseModel: responseModel));
    } catch (e) {
      emit(TeacherGetError(error: e.toString()));
    }
  }



  Future<FutureOr<void>> _createTeacherApi(
      CreateTeacherEvent event, Emitter<TeacherState> emit) async {
    try {
      emit(TeacherCreateLoading());
      var responseModel = await teacherRepository.createClassApi(event.map);
      emit(TeacherCreateLoadingDismiss());
      if (responseModel.status == "${RepoResponseStatus.success}") {
        emit(TeacherCreateSuccess(responseModel: responseModel));
      } else {
        emit(TeacherCreateError(error: responseModel.message));
      }
    } catch (e) {
      emit(TeacherCreateError(error: e.toString()));
    }
  }
}
