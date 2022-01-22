import 'dart:io';
import 'package:covid_wallet_app/bloc/card/card_bloc.dart';
import 'package:covid_wallet_app/theme/text_styles.dart';
import 'package:covid_wallet_app/theme/values/colors.dart';
import 'package:covid_wallet_app/theme/values/strings.dart';
import 'package:covid_wallet_app/widgets/vaccination_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class CardScanPage extends StatefulWidget {
  const CardScanPage({Key? key}) : super(key: key);

  @override
  State<CardScanPage> createState() => _CardScanPageState();
}

class _CardScanPageState extends State<CardScanPage> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      context.read<CardBloc>().add(ChangeCurrentCardEvent(barCode: scanData.code));
      // _qrController.getPayment(scanData.code??"");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return BlocBuilder<CardBloc,CardState>(
        builder: (context,state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Center(
                  child: Text(
                    Strings.scanTitle,
                    style: TextStyles.titleCardStyle,
                  )
              ),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.all(size.width*0.1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // key: qrKey,
                      child: QRView(
                        onQRViewCreated: _onQRViewCreated,
                        key: qrKey,
                        overlay: QrScannerOverlayShape(
                          borderColor: colorPrimary,
                          cutOutSize: 2000,
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,),
                      ),
                    ),
                  )
              ),

              SizedBox(height: 10,),
              Center(
                  child: Text(
                    Strings.scanCard,
                    textAlign: TextAlign.center,
                    style: TextStyles.subtitleCardStyle,
                  )),
              SizedBox(height: 20,),
            ],
          );
        }
    );
  }
}
