import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/address/addresscontainer.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'Add Your Address',
            style: GoogleFonts.junge(
              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFieldWidget(
              size: size,
              fieldName: 'Name',
              textController: nameController,
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              size: size,
              fieldName: 'Pincode',
              textController: pincodeController,
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              size: size,
              fieldName: 'Address',
              textController: addressController,
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              size: size,
              fieldName: 'Phone',
              textController: phoneController,
              
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              size: size,
              fieldName: 'City',
              textController: cityController,
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              size: size,
              fieldName: 'State',
              textController: stateController,
            ),
          ],
        ),
      ),
    );
  }
}
