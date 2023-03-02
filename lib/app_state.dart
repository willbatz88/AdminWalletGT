import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _itemsMenu = [];
  List<String> get itemsMenu => _itemsMenu;
  set itemsMenu(List<String> _value) {
    _itemsMenu = _value;
  }

  void addToItemsMenu(String _value) {
    _itemsMenu.add(_value);
  }

  void removeFromItemsMenu(String _value) {
    _itemsMenu.remove(_value);
  }

  void removeAtIndexFromItemsMenu(int _index) {
    _itemsMenu.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
