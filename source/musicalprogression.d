/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.musicalprogression;

/// Enumeration of musical progressions.
enum MusicalProgression : string
{
  /// There is no progression.
  none = "none",
  /// The progress is unknown or does not fit a specific progression.
  unknown = "unknown",
  /// The melody progresses upwards.
  upwards = "upwards",
  /// The melody progresses downwards.
  downwards = "downwards",
  /// The melody progresses up-downwards.
  upDownwards = "upDownwards",
  /// The melody progresses down-upwards.
  downUpwards = "downUpwards",
  /// The melody is swinging upwards.
  swingingUpwards = "swingingUpwards",
  /// The melody is swinging downwards.
  swingingDownwards = "swingingDownwards",
  /// The melody is steady.
  steady = "steady",
  /// The melody has a steady swinging.
  steadySwing = "steadySwing",
  /// The melody is swinging upwards.
  upSwing = "upSwing",
  /// The melody is swinging downwards.
  downSwing = "downSwing"
}

/// Converts a progression to json.
string toJson(MusicalProgression progression)
{
  import std.string : format;

  return `"%s"`.format(cast(string)progression);
}

/// Converts a progression to xml.
string toXml(MusicalProgression progression)
{
  return progression;
}
