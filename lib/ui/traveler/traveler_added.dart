import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learningtask/bloc/traveler_cubit.dart';
import 'package:learningtask/component/custom_card_traveler.dart';
import 'package:learningtask/component/custom_form.dart';
import 'package:learningtask/theme/const_theme.dart';
import 'package:learningtask/ui/onboarding.dart';
import 'package:learningtask/ui/traveler/traveler_page.dart';

class TravelerAdded extends StatefulWidget {
  const TravelerAdded({
    Key? key,
  }) : super(key: key);

  @override
  State<TravelerAdded> createState() => _TravelerAddedState();
}

class _TravelerAddedState extends State<TravelerAdded> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  _showModalBottomSheet(
      {required Function()? onPressed,
      String mauNgapain = 'Add Traveler',
      String buttonMauNgapain = 'Add'}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        context: context,
        builder: (context) {
          return Wrap(children: [
            Container(
              height: MediaQuery.of(context).size.height - 100,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  mauNgapain,
                  style: textInputDecoration.labelStyle!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomForm(
                  controller: _name,
                  title: 'Name',
                  hintText: 'Type Traveler name here',
                ),
                CustomForm(
                  controller: _email,
                  title: 'Email',
                  hintText: 'Type Traveler email here',
                ),
                CustomForm(
                  controller: _address,
                  title: 'Address',
                  hintText: 'Type Traveler address here',
                ),
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kMaincolor),
                    onPressed: onPressed,
                    child: Text(buttonMauNgapain),
                  ),
                )
              ]),
            ),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelerBlocCubit, TravelerState>(
      builder: (context, state) {
        if (state is TravelerPostSuccess) {
          final id = state.travelerPageResponse.travelerinformation!.id!;
          final name = state.travelerPageResponse.travelerinformation!.name!;
          final email = state.travelerPageResponse.travelerinformation!.email!;
          final address =
              state.travelerPageResponse.travelerinformation!.adderes!;
          return WillPopScope(
            onWillPop: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Onboarding()));
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('Detail Traveler'),
                backgroundColor: kMaincolor,
                elevation: 0,
              ),
              body: CustomCardTraveler(
                id: id,
                name: name,
                email: email,
                address: address,
                onPressedPut: () {
                  _showModalBottomSheet(
                      buttonMauNgapain: 'Edit',
                      mauNgapain: 'Edit Traveler',
                      onPressed: () {
                        if (_name.text.isNotEmpty &&
                            _email.text.isNotEmpty &&
                            _address.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider(
                                        create: (context) => TravelerBlocCubit()
                                          ..putTravelerData(id, _name.text,
                                              _email.text, _address.text),
                                        child: const TravelerAdded(),
                                      )));
                        } else {
                          EasyLoading.showError(
                              'please make sure all form was filled',
                              dismissOnTap: true);
                        }
                      });
                },
                onPressedDelete: () => showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                    title: const Text('Delete Traveler'),
                    content: const Text(
                      'Are you sure want to delete traveler?',
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          await context
                              .read<TravelerBlocCubit>()
                              .deleteTravelerData(id);
                          TravelerState newState =
                              context.read<TravelerBlocCubit>().state;
                          if (newState is TravelerDeleteSuccess) {
                            EasyLoading.showSuccess(
                                'Data Traveler has been deleted',
                                dismissOnTap: true);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                          create: (context) =>
                                              TravelerBlocCubit()
                                                ..fetchingTravelerData(1),
                                          child: const Traveler(),
                                        )));
                          } else {
                            EasyLoading.showError('Delete error',
                                dismissOnTap: true);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      TextButton(
                        child: const Text('No',
                            style: TextStyle(color: Colors.black)),
                        onPressed: () => Navigator.pop(c, false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is TravelerPutSuccess) {
          final id = state.travelerPageResponse.travelerinformation!.id!;
          final name = state.travelerPageResponse.travelerinformation!.name!;
          final email = state.travelerPageResponse.travelerinformation!.email!;
          final address =
              state.travelerPageResponse.travelerinformation!.adderes!;
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
              body: CustomCardTraveler(
                id: id,
                name: name,
                email: email,
                address: address,
                onPressedPut: () {
                  _showModalBottomSheet(
                      buttonMauNgapain: 'Edit',
                      mauNgapain: 'Edit Traveler',
                      onPressed: () {
                        if (_name.text.isNotEmpty &&
                            _email.text.isNotEmpty &&
                            _address.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider(
                                        create: (context) => TravelerBlocCubit()
                                          ..putTravelerData(id, _name.text,
                                              _email.text, _address.text),
                                        child: const TravelerAdded(),
                                      )));
                        } else {
                          EasyLoading.showError(
                              'please make sure all form was filled',
                              dismissOnTap: true);
                        }
                      });
                },
                onPressedDelete: () => showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                    title: const Text('Delete Traveler'),
                    content: const Text(
                      'Are you sure want to delete traveler?',
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          await context
                              .read<TravelerBlocCubit>()
                              .deleteTravelerData(id);
                          TravelerState newState =
                              context.read<TravelerBlocCubit>().state;
                          if (newState is TravelerDeleteSuccess) {
                            EasyLoading.showSuccess(
                                'Data Traveler has been deleted',
                                dismissOnTap: true);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                          create: (context) =>
                                              TravelerBlocCubit()
                                                ..fetchingTravelerData(1),
                                          child: const Traveler(),
                                        )));
                          } else {
                            EasyLoading.showError('Delete error',
                                dismissOnTap: true);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      TextButton(
                        child: const Text('No',
                            style: TextStyle(color: Colors.black)),
                        onPressed: () => Navigator.pop(c, false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is TravelerFailedLoad) {
          return Center(
            child: Text(
              "Oops there's something wrong\nPlease check your internet connection",
              style: textInputDecoration.labelStyle,
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
