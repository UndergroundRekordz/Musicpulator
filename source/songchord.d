/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songchord;

import std.algorithm : map;
import std.string : format;

import musicpulator.tools;
import musicpulator.core;
import musicpulator.constants;
import musicpulator.songchordentry;
import musicpulator.musicalscale;

/// Alias for the chord entry collection.
private alias ChordEntryCollection = InternalMaxSizeCollection!(SongChordEntry, songBarSize);

/// Wrapper around a song chord.
final class SongChord
{
  private:
  /// The entries.
  ChordEntryCollection _entries;
  /// The bar of the chord.
  size_t _bar;
  /// The positive harmonics.
  size_t _positiveHarmonics;
  /// The negative harmonics.
  size_t _negativeHarmonics;

  public:
  final:
  /**
  * Creates a new song chord.
  * Params:
  *   entries =           The entries of the song chord.
  *   bar =               The bar of the chord.
  *   positiveHarmonics = The positive harmonics. 0 by default.
  *   negativeHarmonics = The negative harmonics. 0 by default.
  */
  this(size_t bar, size_t positiveHarmonics = 0, size_t negativeHarmonics = 0)
  {
    _bar = bar;
    _positiveHarmonics = positiveHarmonics;
    _negativeHarmonics = negativeHarmonics;
  }

  /**
  * Creates a new song chord.
  * Params:
  *   entries =           The entries of the song chord.
  *   bar =               The bar of the chord.
  *   positiveHarmonics = The positive harmonics. 0 by default.
  *   negativeHarmonics = The negative harmonics. 0 by default.
  */
  this(SongChordEntry[] entries, size_t bar, size_t positiveHarmonics = 0, size_t negativeHarmonics = 0)
  {
    if (entries && entries.length)
    {
      foreach (entry; entries.map!(e => new SongChordEntry(e.length, e.bar, e.notes.array)))
      {
        _entries.add(entry);
      }
    }

    _bar = bar;
    _positiveHarmonics = positiveHarmonics;
    _negativeHarmonics = negativeHarmonics;
  }

  @property
  {
    /// Gets the entries of the chord.
    ChordEntryCollection entries() { return _entries; }

    /// Gets the scales of the chord.
    const(MusicalScale[][]) scales()
    {
      MusicalScale[][] chordScales;

      foreach (entry; _entries)
      {
        auto entryScales = entry.scalesInternal;

        if (entryScales)
        {
          chordScales ~= entryScales;
        }
      }

      return chordScales;
    }

    /// Gets the positive harmonics of the chord.
    size_t positiveHarmonics() { return _positiveHarmonics; }

    /// Sets the positive harmonics of the chord.
    void positiveHarmonics(size_t harmonics)
    {
      _positiveHarmonics = harmonics;
    }

    /// Gets the negative harmonics of the chord.
    size_t negativeHarmonics() { return _negativeHarmonics; }

    /// Sets the negative harmonics of the chord.
    void negativeHarmonics(size_t harmonics)
    {
      _negativeHarmonics = harmonics;
    }

    /// Gets the bar of the chord.
    size_t bar() { return _bar; }
  }

  /**
  * Adds a entries to the chord entry.
  * Params:
  *   entries = The entries to add.
  */
  void addChordEntry(SongChordEntry entry)
  {
    if (!entry)
    {
      return;
    }

    entry.parentChord = this;

    _entries.add(entry);
  }

  override string toString()
  {
    return toJson();
  }

  string toJson()
  {
    return "{}";
  }

  string toXml()
  {
    return "";
  }
}
