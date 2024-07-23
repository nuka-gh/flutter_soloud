// ignore_for_file: public_member_api_docs

import 'package:flutter_soloud/src/bindings/soloud_controller.dart';
import 'package:flutter_soloud/src/enums.dart';
import 'package:flutter_soloud/src/exceptions/exceptions.dart';
import 'package:flutter_soloud/src/sound_handle.dart';
import 'package:flutter_soloud/src/sound_hash.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';





enum BiquadResonantFilter {
  wet,
  type,
  frequency,
  resonance;

  final List<String> _parameterNames = const [
    'Wet',
    'Type',
    'Frequency',
    'Resonance',
  ];
  final List<double> _mins = const [0, 0.999, 10, 0.1];
  final List<double> _maxs = const [1, 1.1, 16000, 20];
  final List<double> _defs = const [1, 0.999, 0.5, 0.1];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum EqualizerFilter {
  wet,
  band1,
  band2,
  band3,
  band4,
  band5,
  band6,
  band7,
  band8;

  final List<String> _parameterNames = const [
    'Wet',
    'Band 1',
    'Band 2',
    'Band 3',
    'Band 4',
    'Band 5',
    'Band 6',
    'Band 7',
    'Band 8',
  ];
  final List<double> _mins = const [0, 0, 0, 0, 0, 0, 0, 0, 0];
  final List<double> _maxs = const [1, 4, 4, 4, 4, 4, 4, 4, 4];
  final List<double> _defs = const [1, 1, 1, 1, 1, 1, 1, 1, 1];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum EchoFilter {
  wet,
  delay,
  decay,
  filter;

  final List<String> _parameterNames = const [
    'Wet',
    'Delay',
    'Decay',
    'Filter',
  ];
  final List<double> _mins = const [0, 0.001, 0.001, 0];
  final List<double> _maxs = const [1, double.maxFinite, 1, 1];
  final List<double> _defs = const [1, 0.3, 0.7, 0];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum FlangerFilter {
  wet,
  delay,
  freq;

  final List<String> _parameterNames = const ['Wet', 'Delay', 'Freq'];
  final List<double> _mins = const [0, 0.001, 0.001];
  final List<double> _maxs = const [1, 0.1, 100];
  final List<double> _defs = const [1, 0.005, 10];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum BassboostFilter {
  wet,
  boost;

  final List<String> _parameterNames = const ['Wet', 'Boost'];
  final List<double> _mins = const [0, 0];
  final List<double> _maxs = const [1, 10];
  final List<double> _defs = const [1, 2];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum WaveShaperFilter {
  wet,
  amount;

  final List<String> _parameterNames = const ['Wet', 'Amount'];
  final List<double> _mins = const [0, -1];
  final List<double> _maxs = const [1, 1];
  final List<double> _defs = const [1, 0];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum RobotizeFilter {
  wet,
  frequency,
  waveform;

  final List<String> _parameterNames = const ['Wet', 'Frequency', 'Waveform'];
  final List<double> _mins = const [0, 0.1, 0];
  final List<double> _maxs = const [1, 100, 6];
  final List<double> _defs = const [1, 30, 0];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum FreeverbFilter {
  wet,
  freeze,
  roomSize,
  damp,
  width;

  final List<String> _parameterNames = const [
    'Wet',
    'Freeze',
    'Room Size',
    'Damp',
    'Width',
  ];
  final List<double> _mins = const [0, 0, 0, 0, 0];
  final List<double> _maxs = const [1, 1, 1, 1, 1];
  final List<double> _defs = const [1, 0, 0.5, 0.5, 1];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

enum PitchShiftFilter {
  wet,
  shift,
  semitones;

  final List<String> _parameterNames = const ['Wet', 'Shift', 'Semitones'];
  final List<double> _mins = const [0, 0, -48];
  final List<double> _maxs = const [1, 3, 48];
  final List<double> _defs = const [1, 1, 0];

  String parameterName() => _parameterNames[index];
  double min() => _mins[index];
  double max() => _maxs[index];
  double def() => _defs[index];
  int get attributeId => index;
}

// ///////////////////////////////////////////////
// Old way to manage filters. Deprecating these
// ///////////////////////////////////////////////

/// The parameters for each filter.
@Deprecated('Please use the SoLoud.filters or AudioSource.filters.')
typedef FxParams = ({
  String title,
  List<String> names,
  List<double> mins,
  List<double> maxs,
  List<double> defs,
});

/// Biquad Resonant filter
@Deprecated('Please use the SoLoud.filters or AudioSource.filters.')
const FxParams fxBiquadResonant = (
  title: 'Biquad Resonant',

  /// [Type] type is int
  names: ['Wet', 'Type', 'Frequency', 'Resonance'],
  mins: [0, 0.999, 10, 0.1],
  maxs: [1, 1.1, 16000, 20],
  defs: [1, 0.999, 0.5, 0.1],
);

/// EQ filter
@Deprecated('Please use the SoLoud.filters or AudioSource.filters.')
const FxParams fxEq = (
  title: 'Equalizer',
  names: [
    'Wet',
    'Band 1',
    'Band 2',
    'Band 3',
    'Band 4',
    'Band 5',
    'Band 6',
    'Band 7',
    'Band 8',
  ],
  mins: [0, 0, 0, 0, 0, 0, 0, 0, 0],
  maxs: [1, 4, 4, 4, 4, 4, 4, 4, 4],
  defs: [1, 1, 1, 1, 1, 1, 1, 1, 1],
);

/// Echo filter
const FxParams fxEcho = (
  title: 'Echo',
  names: ['Wet', 'Delay', 'Decay', 'Filter'],
  mins: [0, 0.001, 0.001, 0],
  maxs: [1, double.maxFinite, 1, 1],
  defs: [1, 0.3, 0.7, 0],
);

/// Lo-fi filter
const FxParams fxLofi = (
  title: 'Lofi',
  names: ['Wet', 'Samplerate', 'Bitdepth'],
  mins: [0, 100, 0.5],
  maxs: [1, 22000, 16],
  defs: [1, 4000, 3],
);

/// Flanger filter
const FxParams fxFlanger = (
  title: 'Flanger',
  names: ['Wet', 'Delay', 'Freq'],
  mins: [0, 0.001, 0.001],
  maxs: [1, 0.1, 100],
  defs: [1, 0.005, 10],
);

/// Bass-boost filter
const FxParams fxBassboost = (
  title: 'Bassboost',
  names: ['Wet', 'Boost'],
  mins: [0, 0],
  maxs: [1, 10],
  defs: [1, 2],
);

/// WaveShaper filter
const FxParams fxWaveShaper = (
  title: 'Wave Shaper',
  names: ['Wet', 'Amount'],
  mins: [0, -1],
  maxs: [1, 1],
  defs: [1, 0],
);

/// Robotize filter
const FxParams fxRobotize = (
  title: 'Robotize',

  /// [Waveform] type is int
  names: ['Wet', 'Frequency', 'Waveform'],
  mins: [0, 0.1, 0],
  maxs: [1, 100, 6],
  defs: [1, 30, 0],
);

/// Freeverb (reverb) filter
const FxParams fxFreeverb = (
  title: 'Freeverb',

  /// [Freeze] type is bool
  names: ['Wet', 'Freeze', 'Room Size', 'Damp', 'Width'],
  mins: [0, 0, 0, 0, 0],
  maxs: [1, 1, 1, 1, 1],
  defs: [1, 0, 0.5, 0.5, 1],
);

/// Pitch shift filter
const FxParams fxPitchShift = (
  title: 'PitchShift',
  names: ['Wet', 'Shift', 'Semitones'],
  mins: [0, 0, -48],
  maxs: [1, 3, 48],
  defs: [1, 1, 0],
);
