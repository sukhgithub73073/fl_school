import 'dart:async';

import 'package:fl_school/src/data/repository/pincode_repo.dart';
import 'package:fl_school/src/data/repository/school_repo.dart';
import 'package:flutter/material.dart';

import 'package:fl_school/src/data/repository/login%20_repo.dart';
import 'package:fl_school/src/data/repository/product_repo.dart';
import 'package:fl_school/src/data/repository/register_repo.dart';
import 'package:get_it/get_it.dart';
typedef AppRunner = FutureOr<void> Function();

class AppInjector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    await GetIt.I.allReady();
    GetIt.I.registerSingleton<LoginRepository>(LoginRepositoryImp());
    GetIt.I.registerSingleton<RegisterRepository>(RegisterRepositoryImp());
    GetIt.I.registerSingleton<SchoolRepository>(SchoolRepositoryImp());
    GetIt.I.registerSingleton<PincodeRepository>(PincodeRepositoryImp());

    GetIt.I.registerSingleton<ProductRepository>(ProductRepositoryImp());
    GetIt.I.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());

  }
}