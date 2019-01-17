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
import musicpulator.songchord;
import musicpulator.musicalscale;
import musicpulator.tools;
import musicpulator.core;
import musicpulator.constants;

/// Wrapper around a song chord entry.
final class SongChordEntry
{
  private:
  /// The notes.
  InternaleCollection!SongNote _notes;
  /// The length.
  size_t _length;
  /// The bar.
  size_t _bar;
  /// The scales of the chord entry.
  MusicalScale[] _scales;
  /// Boolean determining whether the chord entry has found its scale or not yet.
  bool _foundScale;
  /// The parent chord.
  SongChord _parentChord;

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
  *   parentChord = The parent chord.
  *   length =      The length.
  *   bar =         The bar.
  */
  this(size_t length, size_t bar, SongChord parentChord)
  {
    _length = length;
    _bar = bar;
    _parentChord = parentChord;
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

    if (notes && notes.length)
    {
      foreach (note; notes.map!(n => new SongNote(n.note, n.step, n.octave, this)))
      {
        _notes.add(note);
      }
    }
  }

  /**
  * Creates a new chord entry.
  * Params:
  *   length =      The length.
  *   bar =         The bar.
  *   notes =       The notes.
  *   parentChord = The parent chord.
  */
  this(size_t length, size_t bar, SongNote[] notes, SongChord parentChord)
  {
    _length = length;
    _bar = bar;
    _parentChord = parentChord;

    if (notes && notes.length)
    {
      foreach (note; notes.map!(n => new SongNote(n.note, n.step, n.octave, this)))
      {
        _notes.add(note);
      }
    }
  }

  @property
  {
    /// Gets the notes of the chord entry.
    InternaleCollection!SongNote notes() { return _notes; }

    /// Gets the scales of the chord entry.
    const(MusicalScale[]) scales()
    {
      return scalesInternal();
    }

    package(musicpulator)
    {
      MusicalScale[] scalesInternal()
      {
        if (!_foundScale)
        {
          _foundScale = true;

          _scales = findScales(_notes.map!(n => n.note).array);
        }

        return _scales;
      }
    }

    /// Sets the length of the chord entry.
    void length(size_t newLength)
    {
      size_t maxLength = songBarSize;

      if (_parentChord && _parentChord.entries.length)
      {
        maxLength = songBarSize / _parentChord.entries.length;
      }

      if (newLength > maxLength)
      {
        newLength = maxLength;
      }
      else if (newLength == 0)
      {
        newLength = 1;
      }

      _length = newLength;
    }

    /// Gets the length of the chord entry.
    size_t length()
    {
      size_t maxLength = songBarSize;

      if (_parentChord && _parentChord.entries.length)
      {
        maxLength = songBarSize / _parentChord.entries.length;
      }

      if (_length > maxLength)
      {
        _length = maxLength;
      }
      else if (_length == 0)
      {
        _length = 1;
      }

      return _length;
    }

    /// Gets the bar of the chord entry.
    size_t bar()
    {
      if (_parentChord)
      {
        return _parentChord.bar + _bar;
      }

      return _bar;
    }

    /// Sets the bar of the chord entry.
    void bar(size_t newBar)
    {
      _bar = newBar;
    }

    /// Gets the parent chord.
    SongChord parentChord() { return _parentChord; }

    package(musicpulator)
    {
      /// Sets the parent chord.
      void parentChord(SongChord chord)
      {
        _parentChord = chord;
      }
    }
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

    _notes.add(note);

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
      .format(_notes.map!(n => n.toJson()).joiner(",").array, scales ? _scales.map!(s => s.toJson()).joiner(",").array : [], length, bar);
  }

  /// Converts the chord entry to xml.
  string toXml()
  {
    auto noteXml = "";

    if (_notes.length)
    {
      noteXml = _notes.map!(n => n.toXml()).array.join;
    }

    auto scaleXml = "";

    if (scales && scales.length)
    {
      scaleXml = _scales.map!(s => s.toXml()).array.join;
    }

    return `<SongChordEntry length="%d" bar="%d"><SongNotes>%s</SongNotes><Scales>%s</Scales></SongChordEntry>`
      .format(length, bar, noteXml, scaleXml);
  }
}
