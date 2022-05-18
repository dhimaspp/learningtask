import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningtask/bloc/traveler_cubit.dart';
import 'package:learningtask/theme/const_theme.dart';
import 'package:learningtask/ui/encrypting/host/host_chat.dart';
import 'package:learningtask/ui/traveler/traveler_page.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Learning Task'),
        backgroundColor: kMaincolor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: kSecondaryColor,
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 12, right: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    primary: Colors.white,
                    side: const BorderSide(color: kMaincolor, width: 3)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HostSide()));
                },
                child: Text(
                  'Encrypting RSA',
                  style: textInputDecoration.labelStyle,
                )),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: kSecondaryColor,
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 12, right: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    primary: Colors.white,
                    side: const BorderSide(color: kMaincolor, width: 3)),
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (context) =>
                                TravelerBlocCubit()..fetchingTravelerData(1),
                            child: const Traveler(),
                          )));
                },
                child: Text(
                  'Post And Get Data with XML',
                  style: textInputDecoration.labelStyle,
                ))
          ],
        ),
      ),
    );
  }
}
