import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/utils/media_query_values.dart';
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
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: ListView(
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
              'Create Your Account',
              fontWeight: AppFontsWeight.bold,
              align: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.height45(context)),
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
            ),
            AppConstant.horizontalDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SmallTextWidget('Already have an account?'),
                TextButton(
                  onPressed: () {
                    context.navigateToWithReplacementAndClearStack(
                      Routes.loginRoute,
                    );
                  },
                  child: const SmallTextWidget(
                    'Login',
                    fontWeight: AppFontsWeight.bold,
                  ),
                ),
              ],
            ),
          ],
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
              style: ElevatedButton.styleFrom(),
              child: SmallTextWidget(
                'Register',
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            );
        }
      },
    );
  }
}
