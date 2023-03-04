import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
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
              textInputAction: TextInputAction.done,
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
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {},
                child: const SmallTextWidget('Reset Password?'),
              ),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is LoginWithEmailAndPasswordError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: SmallTextWidget(
                        state.message,
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  );
                  log('Error Happen ${state.message}');
                }
              },
              builder: (context, state) {
                if (state is LoginWithEmailAndPasswordLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          LoginWithEmailAndPasswordEvent(
                            _emailController.text,
                            _passwordController.text,
                          ),
                        );
                      }
                    },
                    child: const SmallTextWidget('Login'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
