import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigTextWidget('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please , enter valid Name';
                  }
                  return null;
                },
                controller: _nameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'HusseinElbhrawy',
                  label: SmallTextWidget('Name'),
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
              AppConstant.horizontalDivider(),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please , enter valid email';
                  }
                  return null;
                },
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'hussein@gmail.com',
                  label: SmallTextWidget('Email Address'),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              AppConstant.horizontalDivider(),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please , enter valid password';
                  }
                  return null;
                },
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                  hintText: '**********',
                  label: const SmallTextWidget('Password'),
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              AppConstant.horizontalDivider(),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length != 11) {
                    return 'please , enter valid phone';
                  }
                  return null;
                },
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: '01069233929',
                  label: SmallTextWidget('Phone'),
                  prefixIcon: Icon(Icons.phone_android_sharp),
                ),
              ),
              AppConstant.horizontalDivider(),
              RegisterButtonWidget(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          RegisterWithEmailAndPasswordEvent(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                            _phoneController.text,
                          ),
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.registerState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: SmallTextWidget(
                state.registerErrorMessage,
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        log(state.toString());
        switch (state.registerState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case RequestState.loaded:
          case RequestState.error:
            return ElevatedButton(
              onPressed: onTap,
              child: const SmallTextWidget('Register'),
            );
        }
        // if (state is RegisterWithEmailAndPasswordLoading) {
        //   return const Center(
        //     child: CircularProgressIndicator.adaptive(),
        //   );
        // }
        // return ElevatedButton(
        //   onPressed: onTap,
        //   child: const SmallTextWidget('Register'),
        // );
      },
    );
  }
}
