// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicediowithcubit/model/user_model.dart';
import 'package:servicediowithcubit/services/user_service.dart';

part 'home_cubit.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  HomeInitial();
}

class HomeSuccess extends HomeState {
  List<UserModel> data;
  HomeSuccess(this.data);
}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeError extends HomeState {
  String msg;
  HomeError(this.msg);
}
