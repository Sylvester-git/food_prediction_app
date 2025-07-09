import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_prediction_app/features/auth/signup_page1.dart';
import 'package:food_prediction_app/features/auth/signup_page2.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/signup_cubit.dart';
import 'package:food_prediction_app/features/cubits/auth/cubit/signup_state.dart';
import 'package:food_prediction_app/features/cubits/food/cubit/foods_cubit.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    loadFoods();
    super.initState();
  }

  loadFoods() async {
    context.read<FoodsCubit>().getFoods();
  }

  final _pagectrl = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final signupcubut = context.watch<SignupCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            context.read<SignupCubit>().resetSignUp();
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pagectrl,
                physics: NeverScrollableScrollPhysics(),
                children: [SignupPage1(), SignupPage2()],
              ),
            ),
            BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Container(
                        decoration: BoxDecoration(color: Colors.green),
                        child: Text(
                          "A confirmation email has been sent to you",
                        ),
                      ),
                    ),
                  );
                  context.read<SignupCubit>().resetSignUp();
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00A875).withOpacity(0.9),
                      disabledBackgroundColor: Color(
                        0xFF00A875,
                      ).withOpacity(0.9),
                    ),
                    onPressed:
                        state.isLoading
                            ? null
                            : () {
                              if (_pagectrl.page == 0 &&
                                  context
                                      .read<SignupCubit>()
                                      .signupform1key
                                      .currentState!
                                      .validate()) {
                                _pagectrl.jumpToPage(1);
                              }
                              if (signupcubut.state.favFoods.isNotEmpty) {
                                context.read<SignupCubit>().signUp();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                    child:
                        state.isLoading
                            ? Center(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            )
                            : Center(child: Text("Next")),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
