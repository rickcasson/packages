// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:camera_avfoundation/camera_avfoundation.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:flutter/services.dart';

import 'messages.g.dart';

/// Creates a [AVCameraDescription] from a Pigeon [PlatformCameraDescription].
AVCameraDescription cameraDescriptionFromPlatform(
    PlatformAVCameraDescription camera) {
  return AVCameraDescription(
    name: camera.name,
    lensDirection: cameraLensDirectionFromPlatform(camera.lensDirection),
    sensorOrientation: 90,
    captureDeviceType: captureDeviceTypeFromPlatform(camera.captureDeviceType),
  );
}

/// Converts a Pigeon [PlatformCameraLensDirection] to a [CameraLensDirection].
CameraLensDirection cameraLensDirectionFromPlatform(
    PlatformCameraLensDirection direction) {
  return switch (direction) {
    PlatformCameraLensDirection.front => CameraLensDirection.front,
    PlatformCameraLensDirection.back => CameraLensDirection.back,
    PlatformCameraLensDirection.external => CameraLensDirection.external,
  };
}

/// Coverts a Pigeon [PlatformAVCaptureDeviceType] to a [AVCaptureDeviceType].
AVCaptureDeviceType captureDeviceTypeFromPlatform(
    PlatformAVCaptureDeviceType type) {
  return switch (type) {
    PlatformAVCaptureDeviceType.builtInWideAngleCamera =>
      AVCaptureDeviceType.builtInWideAngleCamera,
    PlatformAVCaptureDeviceType.builtInUltraWideCamera =>
      AVCaptureDeviceType.builtInUltraWideCamera,
    PlatformAVCaptureDeviceType.builtInTelephotoCamera =>
      AVCaptureDeviceType.builtInTelephotoCamera,
    PlatformAVCaptureDeviceType.builtInDualCamera =>
      AVCaptureDeviceType.builtInDualCamera,
    PlatformAVCaptureDeviceType.builtInTripleCamera =>
      AVCaptureDeviceType.builtInTripleCamera,
    PlatformAVCaptureDeviceType.builtInTrueDepthCamera =>
      AVCaptureDeviceType.builtInTrueDepthCamera,
    PlatformAVCaptureDeviceType.builtInDualWideCamera =>
      AVCaptureDeviceType.builtInDualWideCamera,
    PlatformAVCaptureDeviceType.continuityCamera =>
      AVCaptureDeviceType.continuityCamera,
    PlatformAVCaptureDeviceType.external => AVCaptureDeviceType.external,
    PlatformAVCaptureDeviceType.builtInLiDARDepthCamera =>
      AVCaptureDeviceType.builtInLiDARDepthCamera,
  };
}

/// Convents the given device orientation to Pigeon.
PlatformDeviceOrientation serializeDeviceOrientation(
    DeviceOrientation orientation) {
  switch (orientation) {
    case DeviceOrientation.portraitUp:
      return PlatformDeviceOrientation.portraitUp;
    case DeviceOrientation.portraitDown:
      return PlatformDeviceOrientation.portraitDown;
    case DeviceOrientation.landscapeRight:
      return PlatformDeviceOrientation.landscapeRight;
    case DeviceOrientation.landscapeLeft:
      return PlatformDeviceOrientation.landscapeLeft;
  }
  // The enum comes from a different package, which could get a new value at
  // any time, so provide a fallback that ensures this won't break when used
  // with a version that contains new values. This is deliberately outside
  // the switch rather than a `default` so that the linter will flag the
  // switch as needing an update.
  // ignore: dead_code
  return PlatformDeviceOrientation.portraitUp;
}

/// Converts a Pigeon [PlatformDeviceOrientation] to a [DeviceOrientation].
DeviceOrientation deviceOrientationFromPlatform(
    PlatformDeviceOrientation orientation) {
  return switch (orientation) {
    PlatformDeviceOrientation.portraitUp => DeviceOrientation.portraitUp,
    PlatformDeviceOrientation.portraitDown => DeviceOrientation.portraitDown,
    PlatformDeviceOrientation.landscapeLeft => DeviceOrientation.landscapeLeft,
    PlatformDeviceOrientation.landscapeRight =>
      DeviceOrientation.landscapeRight,
  };
}

/// Converts a Pigeon [PlatformExposureMode] to an [ExposureMode].
ExposureMode exposureModeFromPlatform(PlatformExposureMode mode) {
  return switch (mode) {
    PlatformExposureMode.auto => ExposureMode.auto,
    PlatformExposureMode.locked => ExposureMode.locked,
  };
}

/// Converts a Pigeon [PlatformFocusMode] to an [FocusMode].
FocusMode focusModeFromPlatform(PlatformFocusMode mode) {
  return switch (mode) {
    PlatformFocusMode.auto => FocusMode.auto,
    PlatformFocusMode.locked => FocusMode.locked,
  };
}
