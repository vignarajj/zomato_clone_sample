import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone_sample/connectivity/connectivityStatus.dart';

class ConnectivityService {
  // Create our public controller
  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();

  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

class NetworkProvider{
  StreamSubscription<ConnectivityResult> _subscription;
  StreamController<ConnectivityResult> _networkStatusController;

  StreamSubscription<ConnectivityResult> get subscription => _subscription;
  StreamController<ConnectivityResult> get networkStatusController => _networkStatusController;

  NetworkProvider(){
    _networkStatusController = StreamController<ConnectivityResult>.broadcast();
    _invokeNetworkCheck();
  }

  void _invokeNetworkCheck() async{
    _networkStatusController.sink.add(await Connectivity().checkConnectivity());
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      _networkStatusController.sink.add(event);
    });
  }

  void disposeStream(){
    _subscription.cancel();
    _networkStatusController.close();
  }
}

class ConnectionNotifier extends ChangeNotifier {
bool neTisOn = true;

StreamController<ConnectivityResult> netWorkStatus =
StreamController<ConnectivityResult>();

ConnectionNotifier() {
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    netWorkStatus.add(result);

    setNetWork(result);
  });

  notifyListeners();
}

setNetWork(ConnectivityResult value) {
  if (value == ConnectivityResult.none) {
    neTisOn = false;
  } else {
    neTisOn = true;
  }
  notifyListeners();
}
}
