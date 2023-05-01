// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import, unused_field, prefer_final_fields, unused_local_variable, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homeservice/common/Services/constants.dart';
import 'package:homeservice/Serviceprovider/View/Serviceman_Profile/Location.dart';
import 'package:homeservice/common/auth/signin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Customer/View/CustomerSignup/Customersignup.dart';
import '../../common/helper/constants.dart';
import '../../common/riverpod/models/SignupModel.dart';
import '../../common/riverpod/provider/Signup_provider.dart';
import '../../common/riverpod/provider/customerSignup_provider.dart';

class ServicemanSignup extends ConsumerStatefulWidget {
  const ServicemanSignup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServicemanSignupState();
}

class _ServicemanSignupState extends ConsumerState<ServicemanSignup> {
  String _value = "carpenter";
  final List<String> list_items = [
    "carpenter",
    "plumber",
    "laundary",
    "painter"
  ];
  final a = getStringAsync(location);

  final _ServicemanSignupKey = GlobalKey<FormState>();

  bool pressed = false;
  final geolocator =
      Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  Position? _currentPosition;
  String currentAddress = "";

  void getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        pressed = true;
      });

      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  void getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      // Placemark place = p[0];

      setState(() {
        currentAddress =
            "${_currentPosition!.latitude},${_currentPosition!.longitude}";
      });
    } catch (e) {
      print(e);
    }
  }

  final fullnameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();
  final addressctrl = TextEditingController();
  final rolectrl = TextEditingController();
  final pricectrl = TextEditingController();
// Register button validation
  Future<void> servicepRegister() async {
    if (_ServicemanSignupKey.currentState!.validate()) {
      ref.read(serviceSignupNotifierProvider.notifier).ServiceRegister(
          emailctrl.value.text,
          passwordctrl.value.text,
          locationCtrl.text,
          phoneCtrl.value.text,
          addressctrl.value.text,
          fullnameCtrl.value.text,
          _value.toString(),
          pricectrl.value.text.toInt(),
          context);

      await setValue(email, emailctrl.value.text);
      await setValue(password, passwordctrl.value.text);
      await setValue(coordinates, locationCtrl.value.text);
      await setValue(phone, phoneCtrl.value.text);
      await setValue(address, addressctrl.value.text);
      await setValue(fullname, fullnameCtrl.value.text);
      await setValue(role, _value.toString());
    }
  }

  late Register user;
  @override
  void dispose() {
    emailctrl.dispose();
    passwordctrl.dispose();
    fullnameCtrl.dispose();
    locationCtrl.dispose();
    addressctrl.dispose();
    phoneCtrl.dispose();
    pricectrl.dispose();

    final rolectrl = TextEditingController();

    rolectrl.dispose();

    super.dispose();
  }

  bool offsecureText1 = true;

  void _onlockPressed1() {
    if (offsecureText1 == true) {
      setState(() {
        offsecureText1 = false;
        lockIcon = LockIcon().open;
      });
    } else {
      setState(() {
        offsecureText1 = true;
        lockIcon = LockIcon().lock;
      });
    }
  }

  Icon lockIcon = LockIcon().lock;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (_currentPosition != null && currentAddress != null) {
      locationCtrl.text = currentAddress;
    }

    print(locationCtrl.text);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 90, 36, 165),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Signin()));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sign in to experience the best serivces\naround you',
                        style: TextStyle(
                            //fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 160, 20, 0),
                child: Form(
                  key: _ServicemanSignupKey,
                  child: Card(
                    child: Container(
                      // height: height,
                      width: 410,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              // autovalidateMode: AutovalidateMode.always,
                              controller: fullnameCtrl,
                              textInputAction: TextInputAction.next,
                              // onSaved: (input) => user. = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Full Name',
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //autovalidateMode: AutovalidateMode.always,
                              controller: emailctrl,
                              textInputAction: TextInputAction.next,
                              onSaved: (input) => user.email = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Email Address',
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              controller: phoneCtrl,
                              textInputAction: TextInputAction.next,
                              // onSaved: (input) => user.email = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.call),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Phone Number',
                              ),
                              // validator: FormBuilderValidators.compose([
                              //   FormBuilderValidators.required(),
                              //]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: width,
                                height: height * 0.08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey)),
                                // width: 100,
                                // padding: EdgeInsets.all(20),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person_2_outlined),
                                      SizedBox(
                                        width: width * 0.07,
                                      ),
                                      Center(
                                        child: DropdownButton(
                                          value: _value,
                                          items: list_items.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _value = value!;
                                              print(_value);
                                            });
                                          },
                                          hint: Text("Select item"),
                                          disabledHint: Text("Disabled"),
                                          elevation: 8,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              controller: pricectrl,
                              textInputAction: TextInputAction.next,
                              // onSaved: (input) => user.email = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.price_change_rounded),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Price/hr',
                              ),
                              // validator: FormBuilderValidators.compose([
                              //   FormBuilderValidators.required(),
                              //]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordctrl,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) => user.password = input,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: lockIcon,
                                    onPressed: () => _onlockPressed1()),
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Password',
                              ),
                              obscureText: offsecureText1,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6,
                                    errorText:
                                        "Password should be minimum 6 characters"),
                                // FormBuilderValidators.email(),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //initialValue: "jbsjvbc",
                              // readOnly: true,
                              controller: addressctrl,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.cordinates = input,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.place),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Address',
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            pressed == false
                                ? ElevatedButton(
                                    onPressed: getCurrentLocation,
                                    child: Text(
                                      'Get Location',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  )
                                : TextFormField(
                                    //initialValue: "jbsjvbc",
                                    readOnly: true,
                                    controller: locationCtrl,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    onSaved: (input) => user.cordinates = input,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.place),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'Location',
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.deepPurpleAccent)),
                                onPressed: () {
                                  servicepRegister();
                                },
                                child: Text('Sign Up'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
