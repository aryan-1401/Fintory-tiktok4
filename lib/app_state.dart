import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _following = prefs.getInt('ff_following') ?? _following;
    _followers = prefs.getInt('ff_followers') ?? _followers;
    _dark1 = _colorFromIntValue(prefs.getInt('ff_dark1')) ?? _dark1;
  }

  late SharedPreferences prefs;

  int _following = 0;
  int get following => _following;
  set following(int _value) {
    _following = _value;
    prefs.setInt('ff_following', _value);
  }

  int _followers = 124900;
  int get followers => _followers;
  set followers(int _value) {
    _followers = _value;
    prefs.setInt('ff_followers', _value);
  }

  Color _dark1 = Color(4278190080);
  Color get dark1 => _dark1;
  set dark1(Color _value) {
    _dark1 = _value;
    prefs.setString('ff_dark1', _value.value.toString());
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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
