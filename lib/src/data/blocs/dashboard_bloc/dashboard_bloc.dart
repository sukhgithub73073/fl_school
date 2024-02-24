import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fl_school/src/ui/dashboard/tabs/home_tab.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  List<Widget> list = [

    HomeTab(),
    HomeTab(),
    HomeTab(),
    HomeTab(),
    HomeTab(),

  ];

  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>(_onLoadListEvent);
    on<UpdateIndexEvent>(_onUpdateIndex);
  }

  FutureOr<void> _onLoadListEvent(
      DashboardEvent event, Emitter<DashboardState> emit) {
    emit(DashboardLoading());
    emit(DashboardSuccess(widgetList: list , selectedIndex: 0));

  }

  FutureOr<void> _onUpdateIndex(UpdateIndexEvent event, Emitter<DashboardState> emit) {
    emit(DashboardLoading());
    emit(DashboardSuccess(widgetList: list , selectedIndex: event.index)) ;

  }
}
