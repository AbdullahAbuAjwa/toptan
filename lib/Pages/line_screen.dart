import 'package:flutter/material.dart';
import 'package:toptan/Icons/custom_icon_icons.dart';
import 'package:toptan/Widgets/invoice_line_card.dart';
import 'package:toptan/Widgets/send_button.dart';

class LineScreen extends StatefulWidget {
  @override
  _LineScreenState createState() => _LineScreenState();
}

class _LineScreenState extends State<LineScreen> {
  var valueLine;

  var valueNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A8FF),
      appBar: AppBar(
        title: Text('Lines'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff08A8FF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(12.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text('Choose'),
                    itemHeight: 50,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xff08A8FF),
                      size: 30,
                    ),
                    value: valueLine,
                    items: [
                      DropdownMenuItem(
                        child: Text('New Line'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Transform line"),
                        value: 2,
                      ),
                      DropdownMenuItem(child: Text("Invoice line"), value: 3),
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueLine = value;
                      });
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(12.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text('Choose'),
                    itemHeight: 50,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Color(0xff08A8FF),
                      size: 30,
                    ),
                    value: valueNumber,
                    items: [
                      DropdownMenuItem(
                        child: Text('Golden Number'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Second Item"),
                        value: 2,
                      ),
                      DropdownMenuItem(child: Text("Third Item"), value: 3),
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueNumber = value;
                      });
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              height: 50,
              child: TextField(
                keyboardType:TextInputType.phone ,
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
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Photo ID :',
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
                          child: Icon(
                            CustomIcon.ic_devices_camera,
                            color: Color(0xff08A8FF),
                          ),
                        ),
                        title: Text(
                          'Attach the photo ID',
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Photo Sim card :',
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
                          child: Icon(
                            CustomIcon.ic_devices_camera,
                            color: Color(0xff08A8FF),
                          ),
                        ),
                        title: Text(
                          'Attach the photo ID',
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
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Available packages :',
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
                  hintText: 'comment...',
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
