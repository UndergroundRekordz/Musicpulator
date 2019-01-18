/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songmelody;

import std.algorithm : map, joiner;
import std.array : array, join;
import std.string : format;

import musicpulator.songnote;
import musicpulator.musicalscale;
import musicpulator.musicalprogression;
import musicpulator.tools;
import musicpulator.core;

/// Alias for the note collection.
private alias NoteCollection = InternalMaxSizeCollection!(SongNote, 32);

/// Wrapper around a song melody.
final class SongMelody
{
  private:
  /// The scales of the melody.
  MusicalScale[] _scales;
  /// Boolean determining whether the melody has found its scale or not yet.
  bool _foundScale;
  /// The progression of the melody.
  MusicalProgression _progression;
  /// Boolean determining whether the melody has found its progression or not yet.
  bool _foundProgression;
  /// The notes of the melody.
  NoteCollection _notes;

  public:
  final:
  /**
  * Creates a new song melody.
  * Params:
  *   notes = The notes of the melody.
  */
  this(SongNote[] notes)
  {
    if (notes && notes.length)
    {
      foreach (note; notes.map!(n => new SongNote(n.note, n.length, n.step, n.octave, n.bar)))
      {
        _notes.add(note);
      }
    }
  }

  /// Creates a new song melody.
  this()
  {

  }

  @property
  {
    /// Gets the notes of the melody.
    NoteCollection notes() { return _notes; }

    /// Gets the scales of the melody.
    const(MusicalScale[]) scales()
    {
      if (!_foundScale)
      {
        _foundScale = true;

        _scales = findScales(_notes.map!(n => n.note).array);
      }

      return _scales;
    }

    /// Gets the progression of the melody.
    MusicalProgression progression()
    {
      import musicpulator.notes;
      import musicpulator.direction;
      import musicpulator.melodies;

      if (!_foundProgression)
      {
        _foundProgression = true;

        NoteId[] noteIds;

        foreach (note; _notes)
        {
          noteIds ~= getNoteId(note.note, note.octave);
        }

        if (noteIds && noteIds.length)
        {
          auto directions = getNoteDirections(noteIds);

          if (directions)
          {
            _progression = getProgression(directions);
          }
        }
      }

      return _progression;
    }
  }

  /**
  * Appends a note to the melody.
  * Params:
  *   note = The note to append.
  */
  void appendNote(SongNote note)
  {
    if (!note)
    {
      return;
    }

    _notes.add(note);

    _foundScale = false;
    _foundProgression = false;
  }

  /// Converts the musical notes to their relative flat notes.
  void convertToFlat()
  {
    foreach (note; _notes)
    {
      note.convertToFlat;
    }

    _foundScale = false;
    _foundProgression = false;
  }

  /// Converts the musical notes from flat notes to their relative notes.
  void convertFromFlat()
  {
    foreach (note; _notes)
    {
      note.convertFromFlat();
    }

    _foundScale = false;
    _foundProgression = false;
  }

  /// Converts the melody to a string. This will call toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the melody to json.
  string toJson()
  {
    auto notesJson = "[";

    if (_notes.length)
    {
      foreach (note; _notes)
      {
        notesJson ~= note.toJson() ~ ",";
      }

      notesJson.length -= 1;
    }

    notesJson ~= "]";

    auto scalesJson = "[";

    if (scales && _scales.length)
    {
      foreach (scale; _scales)
      {
        scalesJson ~= scale.toJson() ~ ",";
      }

      scalesJson.length -= 1;
    }

    scalesJson ~= "]";

    return `{"notes":%s,"scales":%s,"progression":%s}`
      .format(notesJson, scalesJson, progression.toJson());
  }

  /// Converts the melody to xml.
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

    return `<SongMelody progression="%s"><SongNotes>%s</SongNotes><Scales>%s</Scales></SongMelody>`
      .format(progression.toXml(), noteXml, scaleXml);
  }
}
