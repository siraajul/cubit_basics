import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/internet/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Get) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Not Connected'),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state == InternetState.Get) {
                return const Text('Connected!');
              } else if (state == InternetState.Lost) {
                return const Text('No Connected');
              } else {
                return const Text('Loading');
              }
            },
          ),
        ),
      ),
    );
  }
}
