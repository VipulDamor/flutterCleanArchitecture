import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testflutterclean/presentation/blocks/registration_block/registration_bloc.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: BlocProvider(
        create: (_) => RegistrationBloc(),
        child: registrationUI(context),
      ),
    );
  }
}

Widget registrationUI(BuildContext context) {
  return Center(
    child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      children: [
        BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(hintText: "Username"),
            onChanged: (text) {
              context.read<RegistrationBloc>().add(UsernameChange(text));
            },
          );
        }),
        SizedBox(height: 16.sp),
        BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            return TextField(
              decoration: const InputDecoration(hintText: "Password"),
              onChanged: (text) {
                context.read<RegistrationBloc>().add(PasswordChange(text));
              },
            );
          },
        ),
        SizedBox(height: 32.sp),
        BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  context.read<RegistrationBloc>().add(SubmitRegistration());
                },
                child: const Text("Submit"));
          },
        )
      ],
    ),
  );
}
