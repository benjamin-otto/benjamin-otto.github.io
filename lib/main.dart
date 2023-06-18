// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'providers/providers.dart';

void main() {
  runApp(const ProviderScope(child: ProfileApp()));
}
