/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songchordentry;

import std.algorithm : map, joiner;
import std.array : array, join;
import std.string : format;

import musicpulator.songnote;
import musicpulator.musicalscale;
import musicpulator.tools;

/// Wrapper around a song chord entry.
final class SongChordEntry
{
  private:
  /// The notes.
  SongNote[] _notes;
  /// The length.
  size_t _length;
  /// The bar.
  size_t _bar;
  /// The scales of the chord entry.
  MusicalScale[] _scales;
  /// Boolean determining whether the chord entry has found its scale or not yet.
  bool _foundScale;

  public:
  final:
  /**
  * Creates a new chord entry.
  * Params:
  *   length = The length.
  *   bar =    The bar.
  */
  this(size_t length, size_t bar)
  {
    _length = length;
    _bar = bar;
  }

  /**
  * Creates a new chord entry.
  * Params:
  *   length = The length.
  *   bar =    The bar.
  *   notes =  The notes.
  */
  this(size_t length, size_t bar, SongNote[] notes)
  {
    _length = length;
    _bar = bar;
    _notes = notes;
  }

  @property
  {
    /// Gets the notes of the chord entry.
    const(SongNote[]) notes() { return _notes; }

    /// Gets the scales of the chord entry.
    const(MusicalScale[]) scales()
    {
      if (!_foundScale)
      {
        _foundScale = true;

        _scales = findScales(_notes.map!(n => n.note).array);
      }

      return _scales;
    }

    /// Gets the length of the chord entry.
    size_t length() { return _length; }

    /// Gets the bar of the chord entry.
    size_t bar() { return _bar; }
  }

  /**
  * Adds a note to the chord entry.
  * Params:
  *   note = The note to add.
  */
  void addNote(SongNote note)
  {
    if (!note)
    {
      return;
    }

    note.parentChordEntry = this;

    _notes ~= note;

    _foundScale = false;
  }

  /// Converts the musical notes to their relative flat notes.
  void convertToFlat()
  {
    foreach (note; _notes)
    {
      note.convertToFlat;
    }

    _foundScale = false;
  }

  /// Converts the musical notes from flat notes to their relative notes.
  void convertFromFlat()
  {
    foreach (note; _notes)
    {
      note.convertFromFlat();
    }

    _foundScale = false;
  }

  /// Converts the chord entry to a string. This will call toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the chord entry to json.
  string toJson()
  {
    return `{"notes":%s,"scales":%s,"length":%d,"bar":%d}`
      .format(_notes.map!(n => n.toJson()).joiner(",").array, scales ? _scales.map!(s => s.toJson()).joiner(",").array : [], _length, _bar);
  }

  /// Converts the chord entry to xml.
  string toXml()
  {
    auto noteXml = "";

    if (_notes && _notes.length)
    {
      noteXml = _notes.map!(n => n.toXml()).array.join;
    }

    auto scaleXml = "";

    if (scales && scales.length)
    {
      scaleXml = _scales.map!(s => s.toXml()).array.join;
    }

    return `<SongMelody length="%d" bar="%d"><SongNotes>%s</SongNotes><Scales>%s</Scales></SongMelody>`
      .format(_length, _bar, noteXml, scaleXml);
  }
}
