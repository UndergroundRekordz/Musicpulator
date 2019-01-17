/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songsequence;

import std.algorithm : map, sum;
import std.array : array, join;
import std.string : format;

import musicpulator.musicalnote;
import musicpulator.core;
import musicpulator.constants;

/// Aliases for the song sequence entry collection.
private alias SongSequenceEntryCollection = InternalMaxSizeCollection!(size_t, 32);

/// Wrapper around a song sequence.
final class SongSequence
{
  private:
  /// The note of the sequence.
  MusicalNote _note;
  /// The entries of the sequence.
  SongSequenceEntryCollection _entries;
  /// The bar of the sequence.
  size_t _bar;
  /// The octave of the sequence.
  size_t _octave;

  public:
  final:
  /**
  * Creates a new song sequence.
  * Params:
  *   note =     The note of the sequence.
  *   bar =      The bar of the sequence.
  *   octave =   The octave of the sequence.
  *   sequence = The sequence entries.
  */
  this(MusicalNote note, size_t bar, size_t octave, size_t[] sequence)
  {
    _note = note;
    _bar = bar;
    _octave = octave;

    foreach (s; sequence)
    {
      addEntry(s);
    }
  }

  @property
  {
    /// Gets the note of the sequence.
    MusicalNote note() { return _note; }

    /// Gets the entries of the sequence.
    SongSequenceEntryCollection entries() { return _entries; }

    /// Gets the bar of the sequence.
    size_t bar() { return _bar; }

    /// Gets the octave of the sequence.
    size_t octave() { return _octave; }
  }

  /**
  * Adds an entry to the sequence.
  * Params:
  *   length = The length of the entry to add.
  */
  void addEntry(size_t length)
  {
    size_t maxLength = songBarSize;

    if (_entries.length)
    {
      maxLength = songBarSize - _entries.sum();
    }

    if (length > maxLength)
    {
      length = maxLength;
    }
    else if (length == 0)
    {
      length = 1;
    }

    _entries.add(length);
  }

  /// Converts the sequence to a string. This calls toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the sequence to json.
  string toJson()
  {
    return `{"note":%s,"bar":%d,"octave":%d,"sequenceEntry":%s}`
      .format(_note, bar, _octave, _entries);
  }

  /// Converts the sequence to xml.
  string toXml()
  {
    auto entryXml = "";

    if (_entries.length)
    {
      entryXml = _entries.map!(e => format(`<SequenceEntry length="%d" />`, e)).array.join;
    }

    return `<SongSequence note="" bar="" octave="">%s</SongSequence>`
      .format(_note, bar, _octave, entryXml);
  }
}
