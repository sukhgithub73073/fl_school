import 'package:fl_school/src/data/blocs/detail_bloc/detail_bloc.dart';
import 'package:fl_school/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fl_school/src/data/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_school/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:fl_school/src/data/blocs/product_bloc/product_bloc.dart';
import 'package:fl_school/src/data/blocs/register_bloc/register_bloc.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;
  final bool lazy;

  const AppBlocProvider({
    Key? key,
    required this.child,
    this.lazy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: lazy, create: (_) => DashboardBloc()..add(DoLoadList())),
        BlocProvider(lazy: lazy, create: (_) => LoginBloc()),
        BlocProvider(lazy: lazy, create: (_) => DetailBloc()),
        BlocProvider(lazy: lazy, create: (_) => RegisterBloc()),
        BlocProvider(lazy: lazy, create: (_) => PincodeBloc()),


        BlocProvider(
            lazy: lazy,
            create: (_) => ProductBloc()..add(GetProductEvent(map: {}))),
      ],
      child: child,
    );
  }
}
