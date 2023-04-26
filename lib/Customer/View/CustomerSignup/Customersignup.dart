// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import, avoid_print, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homeservice/common/auth/signin.dart';
import 'package:homeservice/common/riverpod/provider/Signup_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../common/helper/constants.dart';
import '../../../common/riverpod/models/SignupModel.dart';
import '../../../common/riverpod/provider/customerSignup_provider.dart';

class CustomerSignup extends ConsumerStatefulWidget {
  const CustomerSignup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends ConsumerState<CustomerSignup> {
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

  final _signupKey = GlobalKey<FormState>();
  final fullnameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();
  final addressctrl = TextEditingController();
  final rolectrl = TextEditingController();

// Register button validation
  Future<void> customerRegister() async {
    if (_signupKey.currentState!.validate()) {
      ref.read(customerSignupNotifierProvider.notifier).CustomerRegister(
          emailctrl.value.text,
          passwordctrl.value.text,
          locationCtrl.text,
          phoneCtrl.value.text,
          addressctrl.value.text,
          fullnameCtrl.value.text,
          rolectrl.value.text,
          context);

      await setValue(email, emailctrl.value.text);
      await setValue(password, passwordctrl.value.text);
      await setValue(coordinates, locationCtrl.value.text);
      await setValue(phone, phoneCtrl.value.text);
      await setValue(address, addressctrl.value.text);
      await setValue(fullname, fullnameCtrl.value.text);
      await setValue(role, rolectrl.value.text);
    }
  }

  bool pressed = false;
  late Register user;
  Icon lockIcon = LockIcon().lock;

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

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    fullnameCtrl.dispose();
    addressctrl.dispose();
    rolectrl.dispose();
    emailctrl.dispose();
    phoneCtrl.dispose();
    locationCtrl.dispose();
    passwordctrl.dispose();
    super.dispose();
  }

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
                        'Sign up to experience the best serivces\naround you',
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
                padding: const EdgeInsets.fromLTRB(20.0, 180, 20, 0),
                child: Form(
                  key: _signupKey,
                  child: Card(
                    child: Container(
                      // height: height * 0.8,
                      width: 410,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fullnameCtrl,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                onSaved: (input) => user.fullName = input,
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
                                controller: emailctrl,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
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
                                controller: phoneCtrl,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                onSaved: (input) => user.phone = input,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.call),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: 'Phone Number',
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: addressctrl,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                onSaved: (input) => user.address = input,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_city),
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
                              TextFormField(
                                controller: rolectrl,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                onSaved: (input) => user.role = input,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_city),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  labelText: 'Role',
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: passwordctrl,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    )
                                  : TextFormField(
                                      //initialValue: "jbsjvbc",
                                      readOnly: true,
                                      controller: locationCtrl,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      onSaved: (input) =>
                                          user.cordinates = input,
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
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepPurpleAccent)),
                                  onPressed: () {
                                    customerRegister();
                                  },
                                  child: Text('Sign Up'))
                            ],
                          ),
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

class LockIcon {
  Icon lock = Icon(
    Icons.visibility_off,
  );
  Icon open = Icon(
    Icons.visibility,
  );
}
