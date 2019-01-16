/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.musicalprogression;

/// Enumeration of musical progressions.
enum MusicalProgression
{
  /// There is no progression.
  none,
  /// The progress is unknown or does not fit a specific progression.
  unknown,
  /// The melody progresses upwards.
  upwards,
  /// The melody progresses downwards.
  downwards,
  /// The melody progresses up-downwards.
  upDownwards,
  /// The melody progresses down-upwards.
  downUpwards,
  /// The melody is swinging upwards.
  swingingUpwards,
  /// The melody is swinging downwards.
  swingingDownwards,
  /// The melody is steady.
  steady,
  /// The melody has a steady swinging.
  steadySwing,
  /// The melody is swinging upwards.
  upSwing,
  /// The melody is swinging downwards.
  downSwing
}
