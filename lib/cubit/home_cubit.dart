part of 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    fetchUser();
  }

  // Logic

  void fetchUser() async {
    emit(HomeLoading());
    await GetUserService.inherentce.getUser().then((dynamic res) {
      if (res is Response) {
        List<UserModel> data =
            (res.data as List).map((e) => UserModel.fromJson(e)).toList();
        emit(HomeSuccess(data));
      } else {
        emit(HomeError(res));
      }
    });
  }
}
