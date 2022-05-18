import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningtask/bloc/traveler_cubit.dart';
import 'package:learningtask/theme/const_theme.dart';
import 'package:learningtask/ui/onboarding.dart';

class TravelerAdded extends StatelessWidget {
  const TravelerAdded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelerBlocCubit, TravelerState>(
      builder: (context, state) {
        if (state is TravelerPostSuccess) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Onboarding()));
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('Success add Traveler'),
                backgroundColor: kMaincolor,
                elevation: 0,
              ),
              body: Container(
                margin: const EdgeInsets.all(12),
                height: 200,
                width: MediaQuery.of(context).size.width - 40,
                child: Card(
                  elevation: 9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'ID: ',
                              style: textInputDecoration.labelStyle,
                            ),
                            Text(
                              state.travelerPageResponse.travelerinformation!
                                  .id!,
                              style: textInputDecoration.labelStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: textInputDecoration.labelStyle,
                            ),
                            Text(
                              state.travelerPageResponse.travelerinformation!
                                  .name!,
                              style: textInputDecoration.labelStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              'Email: ',
                              style: textInputDecoration.labelStyle,
                            ),
                            Text(
                              state.travelerPageResponse.travelerinformation!
                                  .email!,
                              style: textInputDecoration.labelStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              'Address: ',
                              style: textInputDecoration.labelStyle,
                            ),
                            Text(
                              state.travelerPageResponse.travelerinformation!
                                  .adderes!,
                              style: textInputDecoration.labelStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: kMaincolor),
          );
        }
      },
    );
  }
}
