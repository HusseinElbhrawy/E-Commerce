// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/utils/constant.dart';
// import '../../../../../core/widgets/small_text_widget.dart';
// import '../bloc/auth_bloc.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthBloc(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Login'),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'please , enter valid email';
//                   }
//                   return null;
//                 },
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 textInputAction: TextInputAction.next,
//                 decoration: const InputDecoration(
//                   hintText: 'hussein@gmail.com',
//                   label: SmallTextWidget('Email Address'),
//                   prefixIcon: Icon(Icons.email_outlined),
//                 ),
//               ),
//               AppConstant.horizontalDivider(),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'please , enter valid password';
//                   }
//                   return null;
//                 },
//                 controller: _passwordController,
//                 keyboardType: TextInputType.visiblePassword,
//                 obscureText: true,
//                 textInputAction: TextInputAction.done,
//                 decoration: InputDecoration(
//                   hintText: '**********',
//                   label: const SmallTextWidget('Password'),
//                   prefixIcon: const Icon(Icons.lock_outline),
//                   suffixIcon: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.visibility_off,
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: AlignmentDirectional.centerEnd,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const SmallTextWidget('Reset Password?'),
//                 ),
//               ),
//               Builder(builder: (context) {
//                 return LoginButtonWidget(
//                   onTap: () {
//                     context.read<AuthBloc>().add(
//                           const LoginWithEmailAndPasswordEvent(
//                               'hussein@gmail.com', '1234567789'),
//                         );
//                     // if (_formKey.currentState!.validate()) {
//                     //   log(_emailController.text);
//                     //   log(_passwordController.text);
//                     //   context.read<AuthBloc>().add(
//                     //         const LoginWithEmailAndPasswordEvent(
//                     //           // _emailController.text,
//                     //           // _passwordController.text,
//                     //           'hussein@gmail.com',
//                     //           '1234567789',
//                     //         ),
//                     //       );
//                     // }
//                   },
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
