import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Widgets/invoice_line_card.dart';
import 'package:toptan/Widgets/send_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/enum.dart';

class LineScreen extends StatefulWidget {
  @override
  _LineScreenState createState() => _LineScreenState();
}

class _LineScreenState extends State<LineScreen> {
  var valueLine;
  var imageFile;

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('photo_library'.tr()),
                      onTap: () {
                        _getFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('camera'.tr()),
                    onTap: () {
                      _getFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        title: Text('line'.tr()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff08A8FF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  closeProgressThreshold: 1.5,
                  builder: (context) => SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            valueLine = line.newline;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('New line'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            valueLine = line.transformLine;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('Transform line'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            valueLine = line.invoiceLine;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('Invoice line'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      valueLine == line.newline
                          ? 'New line'
                          : valueLine == line.transformLine
                              ? 'Transform line'
                              : 'Invoice line',
                      style: TextStyle(fontSize: 18, color: Color(0xff323B4A)),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xff08A8FF),
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                /*   showMaterialModalBottomSheet(
                  context: context,
                  closeProgressThreshold: 1.5,
                  builder: (context) => SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            valueLine = line.newline;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('New line'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            valueLine = line.transformLine;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('Transform line'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            valueLine = line.invoiceLine;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('Invoice line'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );*/
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Golden Number',
                      style: TextStyle(fontSize: 18, color: Color(0xff323B4A)),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xff08A8FF),
                      size: 30,
                    )
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              height: 50,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  suffixIcon: Icon(
                    CustomIcon.ic_devices_mobile,
                    color: Color(0xff08A8FF),
                  ),
                  fillColor: Colors.white,
                  hintText: '0000-0000-0000',
                  hintStyle: TextStyle(
                    color: Color(0xff4A494B),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'photo_id'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: const Color(0xffffffff),
                          ),
                          child: Icon(
                            CustomIcon.ic_devices_camera,
                            color: Color(0xff08A8FF),
                          ),
                        ),
                      ),
                      //),
                      title: Text(
                        imageFile != null
                            ? imageFile.toString()
                            : 'attach_photo_id'.tr(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'photo_QR_code'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      leading: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: const Color(0xffffffff),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            CustomIcon.ic_devices_camera,
                            color: Color(0xff08A8FF),
                          ),
                        ),
                      ),
                      title: Text(
                        'attach_QR_code'.tr(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: 'available_packages'.tr() == 'الحزم المتوفرة :'
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'available_packages'.tr(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
            InvoiceLineCard(),
            // if(valueLine=='New Line')
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              height: 150,
              margin: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'comment'.tr(),
                  hintStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: const Color(0xff323b4a),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 15),
              child: SendButton(),
            ),
          ],
        ),
      ),
    );
  }
}
