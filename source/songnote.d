/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songnote;

import std.string : format;

import musicpulator.musicalnote;
import musicpulator.constants;
import musicpulator.tools;
import musicpulator.songchordentry;

/// Wrapper around a song note.
final class SongNote
{
  private:
  /// The musical note.
  MusicalNote _note;
  /// The length.
  size_t _length;
  /// The step.
  size_t _step;
  /// The octave.
  size_t _octave;
  /// The bar.
  size_t _bar;
  /// The parent chord entry.
  SongChordEntry _parentChordEntry;

  public:
  final:
  /**
  * Creates a new song note.
  * Params:
  *   note =   The note.
  *   length = The length.
  *   step =   The step.
  *   octave = The octave.
  *   bar =    The bar.
  */
  this(MusicalNote note, size_t length, size_t step, size_t octave, size_t bar)
  {
    _note = note;
    _length = length;
    _step = step;
    _octave = octave;
    _bar = bar;
  }

  /**
  * Creates a new song note.
  * Params:
  *   note =             The note.
  *   step =             The step.
  *   octave =           The octave.
  *   parentChordEntry = The parent chord entry.
  */
  this(MusicalNote note, size_t step, size_t octave, SongChordEntry parentChordEntry)
  {
    _note = note;
    _step = step;
    _octave = octave;
    _parentChordEntry = parentChordEntry;
  }

  @property
  {
    /// Gets the musical note.
    MusicalNote note() { return _note; }

    /// Gets the length.
    size_t length()
    {
      if (_parentChordEntry)
      {
        return _parentChordEntry.length;
      }

      return _length;
    }

    /// Gets the step.
    size_t step() { return _step; }

    /// Gets the relative step.
    size_t relativeStep()
    {
      if (_parentChordEntry)
      {
        return _step + (_parentChordEntry.bar * songBarSize);
      }

      return _step + (_bar * songBarSize);
    }

    /// Gets the octave.
    size_t octave() { return _octave; }

    /// Gets the bar.
    size_t bar()
    {
      if (_parentChordEntry)
      {
        return _parentChordEntry.bar;
      }

      return _bar;
    }

    /// Gets the parent chord entry.
    SongChordEntry parentChordEntry() { return _parentChordEntry; }

    package(musicpulator)
    {
      /// Sets the parent chord entry.
      void parentChordEntry(SongChordEntry chordEntry)
      {
        _parentChordEntry = chordEntry;
      }
    }
  }

  /// Converts the musical note to its relative flat note.
  void convertToFlat()
  {
    _note = convertToFlatNote(_note);
  }

  /// Converts the musical note from a flat note to its relative note.
  void convertFromFlat()
  {
    _note = convertFromFlatNote(_note);
  }

  /// Converts the note to a string. This will call toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the note to json.
  string toJson()
  {
    return `{"note":%s,"length":%d,"step":%d,"relativeStep":%d,"octave":%d,"bar":%d}`
      .format(_note.toJson(), length, _step, relativeStep, _octave, bar);
  }

  /// Converts the note to xml.
  string toXml()
  {
    return `<SongNote note="%s" length="%d" step="%d" relativeStep="%d" octave="%d" bar="%d" />`
      .format(_note.toXml(), length, _step, relativeStep, _octave, bar);
  }
}
