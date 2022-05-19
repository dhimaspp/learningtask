import 'package:flutter/material.dart';
import 'package:learningtask/theme/const_theme.dart';

class CustomCardTraveler extends StatelessWidget {
  const CustomCardTraveler(
      {Key? key,
      required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.onPressedPut,
      required this.onPressedDelete})
      : super(key: key);
  final String id;
  final String name;
  final String email;
  final String address;
  final Function()? onPressedPut;
  final Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        id,
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
                        name,
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
                        email,
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
                        address,
                        style: textInputDecoration.labelStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: onPressedPut,
                      // _showModalBottomSheet(
                      //     mauNgapain: 'Edit Traveler',
                      //     buttonMauNgapain: 'Edit',
                      //     onPressed: () {
                      //       if (_name.text.isNotEmpty &&
                      //           _email.text.isNotEmpty &&
                      //           _address.text.isNotEmpty) {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (_) => BlocProvider(
                      //                       create: (context) => TravelerBlocCubit()
                      //                         ..putTravelerData(
                      //                             state.travelerPageResponse
                      //                                 .travelerinformation!.id!,
                      //                             _name.text,
                      //                             _email.text,
                      //                             _address.text),
                      //                       child: const TravelerAdded(),
                      //                     )));
                      //       } else {
                      //         EasyLoading.showError(
                      //             'please make sure all form was filled',
                      //             dismissOnTap: true);
                      //       }
                      //     }),
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: onPressedDelete,
                      // showDialog(
                      //       context: context,
                      //       builder: (c) => AlertDialog(
                      //         title: const Text('Delete Traveler'),
                      //         content: const Text(
                      //           'Are you sure want to delete traveler?',
                      //         ),
                      //         actions: [
                      //           TextButton(
                      //             child: const Text(
                      //               'Yes',
                      //               style: TextStyle(
                      //                   color: Colors.black),
                      //             ),
                      //             onPressed: () async {
                      //               await context
                      //                   .read<TravelerBlocCubit>()
                      //                   .deleteTravelerData(state
                      //                       .travelerPageResponse
                      //                       .travelerinformation!
                      //                       .id!);
                      //               TravelerState newState = context
                      //                   .read<TravelerBlocCubit>()
                      //                   .state;
                      //               if (newState
                      //                   is TravelerDeleteSuccess) {
                      //                 EasyLoading.showSuccess(
                      //                     'Data Traveler has been deleted',
                      //                     dismissOnTap: true);
                      //                 Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                         builder: (_) =>
                      //                             BlocProvider(
                      //                               create: (context) =>
                      //                                   TravelerBlocCubit()
                      //                                     ..fetchingTravelerData(
                      //                                         1),
                      //                               child:
                      //                                   const Traveler(),
                      //                             )));
                      //               } else {
                      //                 EasyLoading.showError(
                      //                     'Delete error',
                      //                     dismissOnTap: true);
                      //                 Navigator.of(context).pop();
                      //               }
                      //             },
                      //           ),
                      //           TextButton(
                      //             child: const Text('No',
                      //                 style: TextStyle(
                      //                     color: Colors.black)),
                      //             onPressed: () =>
                      //                 Navigator.pop(c, false),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      icon: const Icon(Icons.delete_forever_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
