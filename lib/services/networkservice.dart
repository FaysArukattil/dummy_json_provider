//Checks the network connectivity status of the device

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class NetworkService with ChangeNotifier {
  bool _isconnected = false;

  bool get isconnected => _isconnected;

  set isconnected(bool value) {
    _isconnected = value;
  }

  String _statusMessage = "Checking network status...";
  String get statusMessage => _statusMessage;

  // ignore: unused_field
  late StreamSubscription _streamSubscription;
  final Connectivity _connectivity = Connectivity();

  NetworkService() {
    _init();
  }
  Future<void> _init() async {
    await checkInternet();
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  Future<void> checkInternet() async {
    var connectivityresult = await _connectivity.checkConnectivity();
    if (connectivityresult.first == (ConnectivityResult.none)) {
      _isconnected = false;
      _statusMessage = "No internet connection";
      notifyListeners();
      return;
    } else if (connectivityresult.first == ConnectivityResult.wifi) {
      _isconnected = true;
      _statusMessage = "Connected to the Wifi network";
      notifyListeners();
      return;
    } else if (connectivityresult.first == ConnectivityResult.ethernet) {
      _isconnected = true;
      _statusMessage = "Connected to the Ethernet network";
      notifyListeners();
      return;
    } else if (connectivityresult.first == ConnectivityResult.mobile) {
      _isconnected = true;
      _statusMessage = "Connected to the Mobile network";
      notifyListeners();
      return;
    } else if (connectivityresult.first == ConnectivityResult.vpn) {
      _isconnected = true;
      _statusMessage = "Connected to the VPN network";
      notifyListeners();
      return;
    } else {
      try {
        final resp = await http.get(Uri.parse("https://www.google.com"));
        if (resp.statusCode == 200) {
          _isconnected = true;
          _statusMessage = "Network status is Connected";
          notifyListeners();
        }
      } catch (e) {
        debugPrint(e.toString());
        _isconnected = false;
        _statusMessage = "Not Connected";
        notifyListeners();
      }

      return;
    }
  }

  void checkConnectivity() {
    checkInternet();
  }
}
