import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
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
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppDimensions.height45(context) * 2.5,
                bottom: AppDimensions.height45(context),
              ),
              child: SvgPicture.asset(
                AppSvgAssets.appLogo,
              ),
            ),
            const BigTextWidget(
              AppStrings.loginToYourAccount,
              align: TextAlign.center,
              fontWeight: AppFontsWeight.bold,
            ),
            SizedBox(height: AppDimensions.height45(context)),
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
            AppConstant.horizontalDivider(),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                const SmallTextWidget('Remember me'),
              ],
            ),
            AppConstant.horizontalDivider(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.loginState == RequestState.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: SmallTextWidget(
                        state.loginErrorMessage,
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  );
                  log('Error Happen ${state.loginErrorMessage}');
                }
              },
              builder: (context, state) {
                switch (state.loginState) {
                  case RequestState.loading:
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  case RequestState.loaded:
                  case RequestState.error:
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
                      child: SmallTextWidget(
                        'Login',
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    );
                }
              },
            ),
            AppConstant.horizontalDivider(),
            Align(
              alignment: AlignmentDirectional.center,
              child: TextButton(
                onPressed: () {},
                child: const SmallTextWidget('Reset Password?'),
              ),
            ),
            SizedBox(height: AppDimensions.height45(context) * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SmallTextWidget('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    context.navigateToWithReplacementAndClearStack(
                      Routes.registersRoute,
                    );
                  },
                  child: const SmallTextWidget('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
