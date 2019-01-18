/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.musicalscale;

import std.string : format;

import musicpulator.musicalnote;
import musicpulator.tools;

/// Enumeration of scale names.
enum MusicalScaleName : string
{
  /// The C major scale.
  cMajor = "C Major",
  /// The C minor scale.
  cMinor = "C Minor",
  /// The C# major scale.
  cSharpMajor = "C# Major",
  /// The C# minor scale.
  cSharpMinor = "C# Minor",
  /// The D major scale.
  dMajor = "D Major",
  /// The D minor scale.
  dMinor = "D Minor",
  /// The D# major scale.
  dSharpMajor = "D# Major",
  /// The D# minor scale.
  dSharpMinor = "D# Minor",
  /// The Db major scale.
  dFlatMajor = "Db Major",
  /// The Db minor scale.
  dFlatMinor = "Db Minor",
  /// The E major scale.
  eMajor = "E Major",
  /// The E minor scale.
  eMinor = "E Minor",
  /// The Eb major scale.
  eFlatMajor = "Eb Major",
  /// The Eb minor scale.
  eFlatMinor = "Eb Minor",
  /// The F major scale.
  fMajor = "F Major",
  /// The F minor scale.
  fMinor = "F Minor",
  /// The F# major scale.
  fSharpMajor = "F# Major",
  /// The F# minor scale.
  fSharpMinor = "F# Minor",
  /// The G major scale.
  gMajor = "G Major",
  /// The G minor scale.
  gMinor = "G Minor",
  /// The G# major scale.
  gSharpMajor = "G# Major",
  /// The G# minor scale.
  gSharpMinor = "G# Minor",
  /// The Gb major scale.
  gFlatMajor = "Gb Major",
  /// The Gb minor scale.
  gFlatMinor = "Gb Minor",
  /// The A major scale.
  aMajor = "A Major",
  /// The A minor scale.
  aMinor = "A Minor",
  /// The A# major scale.
  aSharpMajor = "A# Major",
  /// The A# minor scale.
  aSharpMinor = "A# Minor",
  /// The Ab major scale.
  aFlatMajor = "Ab Major",
  /// The Ab minor scale.
  aFlatMinor = "Ab Minor",
  /// The b major scale.
  bMajor = "B Major",
  /// The B minor scale.
  bMinor = "B Minor",
  /// The Bb major scale.
  bFlatMajor = "Bb Major",
  /// The Bb minor scale.
  bFlatMinor = "Bb Minor"
}

/// Enumeration of scale types.
enum MusicalScaleType : string
{
  /// A major scale.
  major = "Major",
  /// A minor scale.
  minor = "Minor"
}

/// A wrapper around a scale note.
final class MusicalScaleNote
{
  private:
  /// The note.
  MusicalNote _note;
  /// The octave incrementer.
  size_t _octaveIncrementer;

  public:
  final:
  /**
  * Creates a new scale note.
  * Params:
  *   note = The note.
  *   octaveIncrementer = The octave incrementer. (This is by default 0.)
  */
  this(MusicalNote note, size_t octaveIncrementer = 0)
  {
    _note = note;
    _octaveIncrementer = octaveIncrementer;
  }

  @property
  {
    /// Gets the note.
    MusicalNote note() { return _note; }

    /// Gets the octave incrementer.
    size_t octaveIncrementer() { return _octaveIncrementer; }
  }

  /// Converts the scale note to a string. This will call toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the scale note to json.
  string toJson()
  {
    return `{"note":%s,"octaveIncrementer":%d}`
      .format(_note.toJson(), _octaveIncrementer);
  }

  /// Converts the scale note to xml.
  string toXml()
  {
    return `<ScaleNote note="%s" octaveIncrementer="%d" />`
      .format(_note.toXml(), _octaveIncrementer);
  }
}

/// Wrapper around a musical scale.
final class MusicalScale
{
  private:
  /// The name of the scale.
  MusicalScaleName _scale;
  /// The note of the scale.
  MusicalNote _note;
  /// The type of the scale.
  MusicalScaleType _type;

  public:
  final:
  /**
  * Creates a new musical scale.
  * Params:
  *   scale = The name of the scale.
  *   note = The base note of the scale.
  *   type = The type of the scale.
  */
  this(MusicalScaleName scale, MusicalNote note, MusicalScaleType type)
  {
    _scale = scale;
    _note = note;
    _type = type;
  }

  @property
  {
    /// Gets the scale name.
    MusicalScaleName scale() { return _scale; }

    /// Gets the name.
    MusicalNote note() { return _note; }

    /// Gets the type.
    MusicalScaleType type() { return _type; }
  }

  /// Gets a set of natural notes within the scale.
  MusicalNote[] getNaturalNotes()
  {
    return getNotes().translateToNaturalNotes();
  }

  /// Gets a set of notes within the scale.
  MusicalScaleNote[] getNotes()
  {
    final switch (_scale)
    {
      // Major Scales:

      case MusicalScaleName.cMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.c), new MusicalScaleNote(MusicalNote.d),
          new MusicalScaleNote(MusicalNote.e), new MusicalScaleNote(MusicalNote.f),
          new MusicalScaleNote(MusicalNote.g), new MusicalScaleNote(MusicalNote.a),
          new MusicalScaleNote(MusicalNote.b)
        ];

      case MusicalScaleName.dMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.d), new MusicalScaleNote(MusicalNote.e),
          new MusicalScaleNote(MusicalNote.fSharp), new MusicalScaleNote(MusicalNote.g),
          new MusicalScaleNote(MusicalNote.a), new MusicalScaleNote(MusicalNote.b),
          new MusicalScaleNote(MusicalNote.cSharp, 1)
        ];

      case MusicalScaleName.eMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.e), new MusicalScaleNote(MusicalNote.fSharp),
          new MusicalScaleNote(MusicalNote.gSharp), new MusicalScaleNote(MusicalNote.a),
          new MusicalScaleNote(MusicalNote.b), new MusicalScaleNote(MusicalNote.cSharp, 1),
          new MusicalScaleNote(MusicalNote.dSharp, 1)
        ];

      case MusicalScaleName.fMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.f), new MusicalScaleNote(MusicalNote.g),
          new MusicalScaleNote(MusicalNote.a), new MusicalScaleNote(MusicalNote.bFlat),
          new MusicalScaleNote(MusicalNote.c, 1), new MusicalScaleNote(MusicalNote.d, 1),
          new MusicalScaleNote(MusicalNote.e, 1)
        ];

      case MusicalScaleName.gMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.g), new MusicalScaleNote(MusicalNote.a),
          new MusicalScaleNote(MusicalNote.b), new MusicalScaleNote(MusicalNote.c, 1),
          new MusicalScaleNote(MusicalNote.d, 1), new MusicalScaleNote(MusicalNote.e, 1),
          new MusicalScaleNote(MusicalNote.fSharp, 1)
        ];

      case MusicalScaleName.aMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.a), new MusicalScaleNote(MusicalNote.b),
          new MusicalScaleNote(MusicalNote.cSharp, 1), new MusicalScaleNote(MusicalNote.d, 1),
          new MusicalScaleNote(MusicalNote.e, 1), new MusicalScaleNote(MusicalNote.fSharp, 1),
          new MusicalScaleNote(MusicalNote.gSharp, 1)
        ];

      case MusicalScaleName.bMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.b), new MusicalScaleNote(MusicalNote.cSharp, 1),
          new MusicalScaleNote(MusicalNote.dSharp, 1), new MusicalScaleNote(MusicalNote.e, 1),
          new MusicalScaleNote(MusicalNote.fSharp, 1), new MusicalScaleNote(MusicalNote.gSharp, 1),
          new MusicalScaleNote(MusicalNote.aSharp, 1)
        ];

      case MusicalScaleName.cSharpMajor:
      case MusicalScaleName.dFlatMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.dFlat), new MusicalScaleNote(MusicalNote.eFlat),
          new MusicalScaleNote(MusicalNote.f), new MusicalScaleNote(MusicalNote.gFlat),
          new MusicalScaleNote(MusicalNote.aFlat), new MusicalScaleNote(MusicalNote.bFlat),
          new MusicalScaleNote(MusicalNote.c, 1)
        ];

      case MusicalScaleName.dSharpMajor:
      case MusicalScaleName.eFlatMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.eFlat), new MusicalScaleNote(MusicalNote.f),
          new MusicalScaleNote(MusicalNote.g), new MusicalScaleNote(MusicalNote.aFlat),
          new MusicalScaleNote(MusicalNote.bFlat), new MusicalScaleNote(MusicalNote.c, 1),
          new MusicalScaleNote(MusicalNote.d, 1)
        ];

      case MusicalScaleName.fSharpMajor:
      case MusicalScaleName.gFlatMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.gFlat), new MusicalScaleNote(MusicalNote.aFlat),
          new MusicalScaleNote(MusicalNote.bFlat), new MusicalScaleNote(MusicalNote.cFlat),
          new MusicalScaleNote(MusicalNote.dFlat, 1), new MusicalScaleNote(MusicalNote.eFlat, 1),
          new MusicalScaleNote(MusicalNote.f)
        ];

      case MusicalScaleName.gSharpMajor:
      case MusicalScaleName.aFlatMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.aFlat), new MusicalScaleNote(MusicalNote.bFlat),
          new MusicalScaleNote(MusicalNote.c, 1), new MusicalScaleNote(MusicalNote.dFlat, 1),
          new MusicalScaleNote(MusicalNote.eFlat, 1), new MusicalScaleNote(MusicalNote.f, 1),
          new MusicalScaleNote(MusicalNote.g, 1)
        ];

      case MusicalScaleName.aSharpMajor:
      case MusicalScaleName.bFlatMajor:
        return
        [
          new MusicalScaleNote(MusicalNote.bFlat), new MusicalScaleNote(MusicalNote.c, 1),
          new MusicalScaleNote(MusicalNote.d, 1), new MusicalScaleNote(MusicalNote.eFlat, 1),
          new MusicalScaleNote(MusicalNote.f, 1), new MusicalScaleNote(MusicalNote.g, 1),
          new MusicalScaleNote(MusicalNote.a, 1)
        ];

      // Minor Scales:

      case MusicalScaleName.cMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.c), new MusicalScaleNote(MusicalNote.d),
          new MusicalScaleNote(MusicalNote.eFlat), new MusicalScaleNote(MusicalNote.f),
          new MusicalScaleNote(MusicalNote.g), new MusicalScaleNote(MusicalNote.aFlat),
          new MusicalScaleNote(MusicalNote.bFlat)
        ];

      case MusicalScaleName.dMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.d), new MusicalScaleNote(MusicalNote.e),
          new MusicalScaleNote(MusicalNote.f), new MusicalScaleNote(MusicalNote.g),
          new MusicalScaleNote(MusicalNote.a), new MusicalScaleNote(MusicalNote.bFlat),
          new MusicalScaleNote(MusicalNote.c, 1)
        ];

      case MusicalScaleName.eMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.e), new MusicalScaleNote(MusicalNote.fSharp),
          new MusicalScaleNote(MusicalNote.g), new MusicalScaleNote(MusicalNote.a),
          new MusicalScaleNote(MusicalNote.b), new MusicalScaleNote(MusicalNote.c, 1),
          new MusicalScaleNote(MusicalNote.d, 1)
        ];

      case MusicalScaleName.fMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.f), new MusicalScaleNote(MusicalNote.g),
          new MusicalScaleNote(MusicalNote.aFlat), new MusicalScaleNote(MusicalNote.bFlat),
          new MusicalScaleNote(MusicalNote.c, 1), new MusicalScaleNote(MusicalNote.dFlat, 1),
          new MusicalScaleNote(MusicalNote.eFlat, 1)
        ];

      case MusicalScaleName.gMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.g), new MusicalScaleNote(MusicalNote.a),
          new MusicalScaleNote(MusicalNote.bFlat), new MusicalScaleNote(MusicalNote.c, 1),
          new MusicalScaleNote(MusicalNote.d, 1), new MusicalScaleNote(MusicalNote.eFlat, 1),
          new MusicalScaleNote(MusicalNote.f, 1)
        ];

      case MusicalScaleName.aMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.a), new MusicalScaleNote(MusicalNote.b),
          new MusicalScaleNote(MusicalNote.c), new MusicalScaleNote(MusicalNote.d),
          new MusicalScaleNote(MusicalNote.e), new MusicalScaleNote(MusicalNote.f),
          new MusicalScaleNote(MusicalNote.g)
        ];

      case MusicalScaleName.bMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.b), new MusicalScaleNote(MusicalNote.cSharp, 1),
          new MusicalScaleNote(MusicalNote.d, 1), new MusicalScaleNote(MusicalNote.e, 1),
          new MusicalScaleNote(MusicalNote.fSharp, 1), new MusicalScaleNote(MusicalNote.g, 1),
          new MusicalScaleNote(MusicalNote.a, 1)
        ];

      case MusicalScaleName.dFlatMinor:
      case MusicalScaleName.cSharpMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.cSharp), new MusicalScaleNote(MusicalNote.dSharp, 1),
          new MusicalScaleNote(MusicalNote.e), new MusicalScaleNote(MusicalNote.fSharp),
          new MusicalScaleNote(MusicalNote.gSharp), new MusicalScaleNote(MusicalNote.a),
          new MusicalScaleNote(MusicalNote.b)
        ];

      case MusicalScaleName.dSharpMinor:
      case MusicalScaleName.eFlatMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.eFlat), new MusicalScaleNote(MusicalNote.g),
          new MusicalScaleNote(MusicalNote.gFlat), new MusicalScaleNote(MusicalNote.aFlat),
          new MusicalScaleNote(MusicalNote.bFlat), new MusicalScaleNote(MusicalNote.cFlat),
          new MusicalScaleNote(MusicalNote.dFlat, 1)
        ];

      case MusicalScaleName.gFlatMinor:
      case MusicalScaleName.fSharpMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.fSharp), new MusicalScaleNote(MusicalNote.gSharp),
          new MusicalScaleNote(MusicalNote.a), new MusicalScaleNote(MusicalNote.b),
          new MusicalScaleNote(MusicalNote.cSharp, 1), new MusicalScaleNote(MusicalNote.d, 1),
          new MusicalScaleNote(MusicalNote.e, 1)
        ];

      case MusicalScaleName.aFlatMinor:
      case MusicalScaleName.gSharpMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.gSharp), new MusicalScaleNote(MusicalNote.aSharp),
          new MusicalScaleNote(MusicalNote.b), new MusicalScaleNote(MusicalNote.cSharp, 1),
          new MusicalScaleNote(MusicalNote.dSharp, 1), new MusicalScaleNote(MusicalNote.e, 1),
          new MusicalScaleNote(MusicalNote.fSharp, 1)
        ];

      case MusicalScaleName.aSharpMinor:
      case MusicalScaleName.bFlatMinor:
        return
        [
          new MusicalScaleNote(MusicalNote.bFlat), new MusicalScaleNote(MusicalNote.c, 1),
          new MusicalScaleNote(MusicalNote.dFlat, 1), new MusicalScaleNote(MusicalNote.eFlat, 1),
          new MusicalScaleNote(MusicalNote.f, 1), new MusicalScaleNote(MusicalNote.gFlat, 1),
          new MusicalScaleNote(MusicalNote.aFlat, 1)
        ];
    }
  }

  /// Converts the scale to a string. This will call toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the scale to json.
  string toJson()
  {
    string notes = "[";

    auto scaleNotes = getNotes();

    foreach (scaleNote; scaleNotes)
    {
      notes ~= scaleNote.toJson() ~ ",";
    }

    notes.length -= 1;
    notes ~= "]";

    return `{"scale":"%s","note":"%s","type":"%s","notes":%s}`
      .format(_scale, _note, _type, notes);
  }

  /// Converts the scale to xml.
  string toXml()
  {
    string notes = "";

    auto scaleNotes = getNotes();

    foreach (scaleNote; scaleNotes)
    {
      notes ~= scaleNote.toXml();
    }

    return `<MusicalScale scale="%s" note="%s" type="%s"><ScaleNotes>%s</ScaleNotes></MusicalScale>`
      .format(_scale, _note, _type, notes);
  }
}
