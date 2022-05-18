import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningtask/bloc/traveler_cubit.dart';
import 'package:learningtask/component/custom_form.dart';
import 'package:learningtask/models/get_traveler.dart';
import 'package:learningtask/ui/traveler/traveler_added.dart';

import '../../theme/const_theme.dart';

class Traveler extends StatefulWidget {
  const Traveler({Key? key}) : super(key: key);

  @override
  State<Traveler> createState() => _TravelerState();
}

class _TravelerState extends State<Traveler> {
  TravelPageResponse data = TravelPageResponse();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  _showModalBottomSheet() {
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
                  'Add Traveler',
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
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                    create: (context) => TravelerBlocCubit()
                                      ..postTravelerData(_name.text,
                                          _email.text, _address.text),
                                    child: const TravelerAdded(),
                                  )));
                    },
                    child: const Text('Add'),
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
        if (state is TravelerPageLoaded) {
          data = state.travelerPageResponse;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: const Text('List Traveler'),
              backgroundColor: kMaincolor,
              elevation: 0,
            ),
            body: ListView.builder(
                itemCount: data.travelerinformationResponse!.travelers!
                    .travelerinformation!.length,
                itemBuilder: ((ctx, index) {
                  return ExpansionTile(
                    title: Text(data.travelerinformationResponse!.travelers!
                        .travelerinformation![index].name!),
                    children: [
                      Text(data.travelerinformationResponse!.travelers!
                          .travelerinformation![index].email!),
                      Text(data.travelerinformationResponse!.travelers!
                          .travelerinformation![index].adderes!)
                    ],
                  );
                })),
            bottomSheet: GestureDetector(
              onTap: () => _showModalBottomSheet(),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: kMaincolor),
                child: Text(
                  'Add Traveler',
                  textAlign: TextAlign.center,
                  style: textInputDecoration.labelStyle!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
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
