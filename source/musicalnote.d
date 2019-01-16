/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.musicalnote;

/// Enumeration around music notes.
enum MusicalNote : string
{
  /// The Cb note.
  cFlat = "Cb",
  /// The C note.
  c = "C",
  /// The C# note.
  cSharp = "C#",
  /// The Db note.
  dFlat = "Db",
  /// The D note.
  d = "D",
  /// The D# note.
  dSharp = "D#",
  /// The Eb note.
  eFlat = "Eb",
  /// The E note.
  e = "E",
  /// The F note.
  f = "F",
  /// The F# note.
  fSharp = "F#",
  /// The Gb note.
  gFlat = "Gb",
  /// The G note.
  g = "G",
  /// The G# note.
  gSharp = "G#",
  /// The Ab note.
  aFlat = "Ab",
  /// The A note.
  a = "A",
  /// The A# note.
  aSharp = "A#",
  /// The Bb note.
  bFlat = "Bb",
  /// The B note.
  b = "B"
}

/// Converts a note to json.
string toJson(MusicalNote note)
{
  import std.string : format;

  return `"%s"`.format(cast(string)note);
}

/// Converts a note to xml.
string toXml(MusicalNote note)
{
  return note;
}
