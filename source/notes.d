/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.notes;

import musicpulator.musicalnote;

/// Collection of notes and base ids.
static immutable(ptrdiff_t[MusicalNote]) noteBaseIds;

/// Static constructor for the module.
static this()
{
  noteBaseIds =
  [
    MusicalNote.c : 0,
    MusicalNote.cSharp : 1,
    MusicalNote.dFlat : 1,
    MusicalNote.d : 2,
    MusicalNote.dSharp : 3,
    MusicalNote.eFlat : 3,
    MusicalNote.e : 4,
    MusicalNote.f : 5,
    MusicalNote.fSharp : 6,
    MusicalNote.gFlat : 6,
    MusicalNote.g : 7,
    MusicalNote.gSharp : 8,
    MusicalNote.aFlat : 8,
    MusicalNote.a : 9,
    MusicalNote.aSharp : 10,
    MusicalNote.bFlat : 10,
    MusicalNote.b : 11,
    MusicalNote.cFlat : 11
  ];
}

/// An invalid note id.
private static const NoteId invalidNoteId = NoteId(-1);

/// A note id.
struct NoteId
{
  /// The id of the note.
  package(musicpulator) ptrdiff_t id;
  /**
  * Creates a new note id.
  * Params:
  *   id = The id of the note.
  */
  private this(ptrdiff_t id)
  {
    this.id = id;
  }
}

/**
* Gets the id of a note.
* Params:
*   note = The note to get the id of.
*   octave = The octave the id should be relative to.
* Returns:
*   Returns the id for a note relative to the specific octave.
*/
NoteId getNoteId(MusicalNote note, ptrdiff_t octave)
{
  import std.string : toLower;

  if (!note || !note.length)
  {
    return invalidNoteId;
  }

  auto noteIndex = noteBaseIds.get(note, -1);

  if (noteIndex == -1)
  {
    return invalidNoteId;
  }

  return NoteId((octave * 100) + noteIndex);
}
