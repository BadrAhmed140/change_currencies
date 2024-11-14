import 'package:change_currencies/blocs/current_cubit.dart';
import 'package:change_currencies/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentCubit(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
