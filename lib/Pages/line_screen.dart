import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/custom_icon_icons.dart';
import 'package:toptan/Provider/line_provider.dart';
import 'package:toptan/Widgets/app_bar.dart';
import 'package:toptan/Widgets/button.dart';
import 'package:toptan/Widgets/lines_list.dart';
import 'package:toptan/Widgets/number_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toptan/Helper/enum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineScreen extends StatefulWidget {
  @override
  _LineScreenState createState() => _LineScreenState();
}

class _LineScreenState extends State<LineScreen> {
  File? imageFile;
  String? valueLine;
  int? idLine;
  int? price;
  int? type;
  var valueNumber;
  int? numNumber;
  final commentController = TextEditingController();
  final commentFocus = FocusNode();

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
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('photo_library'.tr()),
                      onTap: () {
                        _getFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
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
      appBar: appBarApp('line'.tr()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinesList(
              line: valueLine,
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  closeProgressThreshold: 1.5,
                  builder: (context) => SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: FutureBuilder(
                      future: Provider.of<LineProvider>(context, listen: false)
                          .getLineOperations(Localizations.localeOf(context)),
                      builder: (ctx, snapshot) => Consumer<LineProvider>(
                        builder: (BuildContext context, data, Widget? child) =>
                            ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.items!.length,
                          itemBuilder: (ctx, i) => InkWell(
                            onTap: () {
                              valueLine = data.items![i].lineOperations!.name
                                  .toString();
                              idLine = data.items![i].lineOperations!.id;
                              price = data.items![i].lineOperations!.costPrice;
                              type = data.items![i].lineOperations!.numberType;
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8.0.h),
                              child: ListTile(
                                title: Text(data.items![i].lineOperations!.name
                                    .toString()),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            NumberLines(
              number: valueNumber == number.GoldenNumbers
                  ? 'golden_number'.tr()
                  : valueNumber == number.SilverNumber
                      ? 'silver_number'.tr()
                      : valueNumber == number.NormalNumber
                          ? 'normal_number'.tr()
                          : 'choose_number'.tr(),
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
                            valueNumber = number.GoldenNumbers;
                            numNumber = 1;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('golden_number'.tr()),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            valueNumber = number.SilverNumber;
                            numNumber = 2;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('silver_number'.tr()),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            valueNumber = number.NormalNumber;
                            numNumber = 3;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text('normal_number'.tr()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (idLine != null)
              Align(
                alignment: Localizations.localeOf(context).languageCode == 'ar'
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.0.w),
                  child: Text(
                    'available_numbers'.tr(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18.sp,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            SizedBox(height: 10.h),
            if (idLine != null && type == numNumber)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: FutureBuilder(
                  future: Provider.of<LineProvider>(context, listen: false)
                      .getLineOperationData(
                          Localizations.localeOf(context), idLine),
                  builder: (ctx, snapshot) => Consumer<LineProvider>(
                    builder: (BuildContext context, data, child) =>
                        GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 1.3.h,
                        mainAxisSpacing: 8.h,
                      ),
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.lineDataItems!.length,
                      itemBuilder: (ctx, i) => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: ListTile(
                          title: Text(
                            data.lineDataItems![i].number.toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 12.0.h),
                            child: Text(
                              '$price\$',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 16.0.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'photo_id'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18.sp,
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
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                            color: const Color(0xffffffff),
                          ),
                          child: Icon(
                            CustomIcon.ic_devices_camera,
                            color: Color(0xff08A8FF),
                            size: 25.sp,
                          ),
                        ),
                      ),
                      //),
                      title: Text(
                        imageFile != null
                            ? imageFile!.path.toString()
                            : 'attach_photo_id'.tr(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.sp,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'photo_QR_code'.tr(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18.sp,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      leading: Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                          color: const Color(0xffffffff),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            CustomIcon.ic_devices_camera,
                            color: Color(0xff08A8FF),
                            size: 25.sp,
                          ),
                        ),
                      ),
                      title: Text(
                        'attach_QR_code'.tr(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.sp,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0.r),
                color: Colors.white,
              ),
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                maxLines: null,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
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
                    fontSize: 16.sp,
                    color: const Color(0xff323b4a),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0.h, bottom: 10.h),
              child: ButtonSend(
                text: 'send'.tr(),
                buttonColor: Colors.white,
                textColor: Color(0xff08A8FF),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
