import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learningtask/bloc/traveler_cubit.dart';
import 'package:learningtask/component/custom_form.dart';
import 'package:learningtask/theme/const_theme.dart';
import 'package:learningtask/ui/onboarding.dart';

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
              body: Container(
                margin: const EdgeInsets.all(12),
                height: 200,
                width: MediaQuery.of(context).size.width - 40,
                child: Card(
                  elevation: 9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'ID: ',
                                  style: textInputDecoration.labelStyle,
                                ),
                                Text(
                                  state.travelerPageResponse
                                      .travelerinformation!.id!,
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
                                  state.travelerPageResponse
                                      .travelerinformation!.name!,
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
                                  state.travelerPageResponse
                                      .travelerinformation!.email!,
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
                                  state.travelerPageResponse
                                      .travelerinformation!.adderes!,
                                  style: textInputDecoration.labelStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () => _showModalBottomSheet(
                                mauNgapain: 'Edit Traveler',
                                buttonMauNgapain: 'Edit',
                                onPressed: () {
                                  if (_name.text.isNotEmpty &&
                                      _email.text.isNotEmpty &&
                                      _address.text.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => BlocProvider(
                                                  create: (context) =>
                                                      TravelerBlocCubit()
                                                        ..putTravelerData(
                                                            state
                                                                .travelerPageResponse
                                                                .travelerinformation!
                                                                .id!,
                                                            _name.text,
                                                            _email.text,
                                                            _address.text),
                                                  child: const TravelerAdded(),
                                                )));
                                  } else {
                                    EasyLoading.showError(
                                        'please make sure all form was filled',
                                        dismissOnTap: true);
                                  }
                                }),
                            icon: const Icon(Icons.edit))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is TravelerPutSuccess) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'ID: ',
                                  style: textInputDecoration.labelStyle,
                                ),
                                Text(
                                  state.travelerPageResponse
                                      .travelerinformation!.id!,
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
                                  state.travelerPageResponse
                                      .travelerinformation!.name!,
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
                                  state.travelerPageResponse
                                      .travelerinformation!.email!,
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
                                  state.travelerPageResponse
                                      .travelerinformation!.adderes!,
                                  style: textInputDecoration.labelStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () => _showModalBottomSheet(
                                mauNgapain: 'Edit Traveler',
                                buttonMauNgapain: 'Edit',
                                onPressed: () {
                                  if (_name.text.isNotEmpty &&
                                      _email.text.isNotEmpty &&
                                      _address.text.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => BlocProvider(
                                                  create: (context) =>
                                                      TravelerBlocCubit()
                                                        ..putTravelerData(
                                                            state
                                                                .travelerPageResponse
                                                                .travelerinformation!
                                                                .id!,
                                                            _name.text,
                                                            _email.text,
                                                            _address.text),
                                                  child: const TravelerAdded(),
                                                )));
                                  } else {
                                    EasyLoading.showError(
                                        'please make sure all form was filled',
                                        dismissOnTap: true);
                                  }
                                }),
                            icon: const Icon(Icons.edit))
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
