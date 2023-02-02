import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_state.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return _scaffold(context, state);
      },
    );
  }

  Scaffold _scaffold(BuildContext context, HomeState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Home page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeSuccess) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(state.data[index].name!),
                  ),
                );
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.msg));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
