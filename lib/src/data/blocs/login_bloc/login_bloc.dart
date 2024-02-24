import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/repository/login%20_repo.dart';
import 'package:get_it/get_it.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  var loginRepository = GetIt.I<LoginRepository>();

  LoginBloc() : super(LoginInitial()) {
    on<DoLoginEvent>(_login);
  }

  Future<FutureOr<void>> _login(
      DoLoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 3)) ;
      emit(LoginSuccess(
          responseModel: await loginRepository.loginApi(event.map)));
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}
