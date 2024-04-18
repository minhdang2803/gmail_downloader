import 'package:attatchments_downloader/controllers/home_screen/home_bloc_cubit.dart';
import 'package:attatchments_downloader/screens/component/custom_button.dart';
import 'package:attatchments_downloader/screens/component/custom_textfield.dart';
import 'package:attatchments_downloader/ultils/themes/color_style.dart';
import 'package:attatchments_downloader/ultils/router/routes.dart';
import 'package:attatchments_downloader/ultils/themes/font_style.dart';
import 'package:attatchments_downloader/ultils/themes/image_resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static MaterialPage page() {
    return MaterialPage(
      child: BlocProvider(
        create: (context) => HomeBlocCubit(),
        child: const LoginScreen(),
      ),
      key: const ValueKey(AppRoutes.loginScreen),
      name: AppRoutes.loginScreen,
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<HomeBlocCubit>()
        .emailController
        .addListener(context.read<HomeBlocCubit>().emailListener);
    context
        .read<HomeBlocCubit>()
        .passwordController
        .addListener(context.read<HomeBlocCubit>().passwordListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (
      context,
      constrains,
    ) {
      if (constrains.maxWidth <= 800) {
        return Column(
          children: [
            Expanded(child: _buildSmallLandingpage(context)),
            Expanded(child: _buildSmalLoginForm(context)),
          ],
        );
      }
      return Row(
        children: [
          Expanded(child: _buildLandingPage(context)),
          Expanded(child: _buildLoginForm(context)),
        ],
      );
    }));
  }

  Widget _buildLoginForm(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width / 2,
          height: MediaQuery.sizeOf(context).height,
          color: ColorStyle.secondary,
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            decoration: BoxDecoration(
                color: Colors.grey.shade50.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(50),
            child: SingleChildScrollView(
              child: Form(
                key: context.read<HomeBlocCubit>().formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login right hereee!",
                      style: FontResource.heading4.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: context.read<HomeBlocCubit>().emailController,
                      icon: Icons.email,
                      label: "Username",
                      hintText: "Please enter your Google username",
                      validator: context.read<HomeBlocCubit>().emailValidator,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      controller:
                          context.read<HomeBlocCubit>().passwordController,
                      icon: Icons.lock,
                      label: "Password",
                      hintText: "Password enter in here",
                      isPassword: true,
                      validator:
                          context.read<HomeBlocCubit>().passwordValidator,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<HomeBlocCubit, HomeState>(
                      builder: (context, state) {
                        return CustomButton(
                          // isDisable: state.isEmailEmpty == true ||
                          //     state.isPasswordEmpty == true,
                          isDisable: false,
                          backgroundColor: ColorStyle.secondary,
                          text: "Login",
                          textStyle: FontResource.heading5.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          onTap: () {
                            context.read<HomeBlocCubit>().onSubmit(context);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSmalLoginForm(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 2,
          color: ColorStyle.secondary,
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            decoration: BoxDecoration(
                color: Colors.grey.shade50.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(50),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: context.read<HomeBlocCubit>().formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login right hereee!",
                      style: FontResource.heading4.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: context.read<HomeBlocCubit>().emailController,
                      icon: Icons.email,
                      label: "Username",
                      hintText: "Please enter your Google username",
                      validator: context.read<HomeBlocCubit>().emailValidator,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      controller:
                          context.read<HomeBlocCubit>().passwordController,
                      icon: Icons.lock,
                      label: "Password",
                      hintText: "Password enter in here",
                      isPassword: true,
                      validator:
                          context.read<HomeBlocCubit>().passwordValidator,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      backgroundColor: ColorStyle.secondary,
                      text: "Login",
                      textStyle: FontResource.heading5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {
                        context.read<HomeBlocCubit>().onSubmit(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLandingPage(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorStyle.primary),
      width: MediaQuery.sizeOf(context).width / 2,
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "\"Attachments Downloader\"",
                  style: FontResource.heading4.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "\nfor my sweetie",
                  style: FontResource.heading4.copyWith(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 500,
            height: 500,
            child: Image.asset(
              ImageResource.backgroundPicture,
              fit: BoxFit.contain,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildSmallLandingpage(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorStyle.primary),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "\"Attachments Downloader\"",
                  style: FontResource.heading5.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "\nfor my sweetie",
                  style: FontResource.heading5.copyWith(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ]),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              ImageResource.backgroundPicture,
              fit: BoxFit.contain,
            ),
          ),
        ]),
      ),
    );
  }
}
