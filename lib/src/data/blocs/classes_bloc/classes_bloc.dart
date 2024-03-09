import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/api_status_code.dart';
import 'package:fl_school/src/data/repository/classes_repo.dart';
import 'package:get_it/get_it.dart';

part 'classes_event.dart';

part 'classes_state.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  var classesRepository = GetIt.I<ClassesRepository>();

  ClassesBloc() : super(ClassesInitial()) {
    on<GetClassesEvent>(_getClassesApi);
    on<GetClassesByGroupEvent>(_getClassesByGroupApi);
    on<CreateClassesEvent>(_createClassesApi);
  }

  Future<FutureOr<void>> _getClassesApi(
      GetClassesEvent event, Emitter<ClassesState> emit) async {
    try {
      emit(ClassesGetLoading());
      var responseModel = await classesRepository.getClassesApi(event.map);
      emit(ClassesGetLoadingDismiss());
      emit(ClassesGetSuccess(responseModel: responseModel));
    } catch (e) {
      emit(ClassesGetError(error: e.toString()));
    }
  }

  Future<FutureOr<void>> _getClassesByGroupApi(
      GetClassesByGroupEvent event, Emitter<ClassesState> emit) async {
    try {
      emit(ClassesGetLoading());
      var responseModel = await classesRepository.getClassesApi(event.map);
      emit(ClassesGetLoadingDismiss());
      emit(ClassesGetSuccess(responseModel: responseModel));
    } catch (e) {
      emit(ClassesGetError(error: e.toString()));
    }

  }

  Future<FutureOr<void>> _createClassesApi(
      CreateClassesEvent event, Emitter<ClassesState> emit) async {
    try {
      emit(ClassesCreateLoading());
      var responseModel = await classesRepository.createClassApi(event.map);
      emit(ClassesCreateLoadingDismiss());
      if (responseModel.status == "${RepoResponseStatus.success}") {
        emit(ClassesCreateSuccess(responseModel: responseModel));
      } else {
        emit(ClassesCreateError(error: responseModel.message));
      }
    } catch (e) {
      emit(ClassesCreateError(error: e.toString()));
    }
  }
}
