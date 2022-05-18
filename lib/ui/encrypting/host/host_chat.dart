// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:learningtask/ui/encrypting/service/rsa_helper.dart';
import 'package:pointycastle/export.dart' as pt;

import '../../../theme/const_theme.dart';

class HostSide extends StatefulWidget {
  const HostSide({Key? key}) : super(key: key);

  @override
  State<HostSide> createState() => _HostSideState();
}

class _HostSideState extends State<HostSide> {
  final rsaKeyPair = generateRSAkeyPair(getSecureRandom());
  TextEditingController txtController = TextEditingController();
  var verbose = true;
  var longText = false;
  var loadingText = '';
  var encryptScheme = '';
  var textInNumber = '';
  var encryptingStatus = '';
  var cipherTextResult = '';
  var decryptedResult = '';
  var decryptedNumber = '';

  void _generateRSAkey(String txt) {
    print(dumpRsaKeys(rsaKeyPair, verbose: verbose));
  }

  void _encryptAndDecrypt(
      pt.AsymmetricKeyPair<pt.RSAPublicKey, pt.RSAPrivateKey> rsaPair,
      AsymBlockCipherToUse scheme,
      Uint8List txt,
      bool verbose) {
    try {
      final cipherText = rsaEncrypt(rsaPair.publicKey, txt, scheme);
      print('Ciphertext:\n${bin2hex(cipherText)}');
      print('\nEncrypting with $scheme: success');

      final decryptedBytes = rsaDecrypt(rsaPair.privateKey, cipherText, scheme);
      if (isUint8ListEqual(decryptedBytes, txt)) {
        setState(() {
          decryptedResult = utf8.decode(decryptedBytes);
        });
        print('decrypted text in utf8 encoded: ($decryptedBytes)');
        print('Decrypted:\n"${utf8.decode(decryptedBytes)}"');
        print('Decrypt ($scheme): success');
      } else {
        print(
            'Decrypted:\n"${utf8.decode(decryptedBytes, allowMalformed: true)}"');
        print('fail: decrypted does not match plaintext');
      }
    } catch (e, st) {
      print('fail: threw unexpected exception: ${e.runtimeType}');
      if (verbose) {
        print('$e\n$st\n');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Task'),
        backgroundColor: kMaincolor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              controller: txtController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: ElevatedButton(
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
                  _generateRSAkey(txtController.text);
                  final bytes = utf8.encode(txtController.text);
                  print(
                      'text to encrypt in utf8 encoded: ${Uint8List.fromList(bytes)}');
                  _encryptAndDecrypt(rsaKeyPair, AsymBlockCipherToUse.rsa,
                      Uint8List.fromList(bytes), verbose);
                },
                child: Text(
                  'Encrypt',
                  style: textInputDecoration.labelStyle,
                )),
          ),
          Text(
            'Decrypted text: $decryptedResult',
            style: textInputDecoration.labelStyle!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          // IconButton(
          //     onPressed: () {
          //       Clipboard.setData(ClipboardData(text: cipherTextResult));
          //     },
          //     icon: const Icon(Icons.copy))
        ],
      ),
    );
  }
}
