/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.notes;

/// Collection of notes and base ids.
static immutable(ptrdiff_t[string]) noteBaseIds;

/// Static constructor for the module.
static this()
{
  noteBaseIds =
  [
    "c" : 0,
    "c#": 1,
    "d": 2,
    "d#": 3,
    "e": 4,
    "f": 5,
    "f#": 6,
    "g": 7,
    "g#": 8,
    "a": 9,
    "a#": 10,
    "b": 11
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
NoteId getNoteId(string note, ptrdiff_t octave)
{
  import std.string : toLower;

  if (!note || !note.length)
  {
    return invalidNoteId;
  }

  auto noteIndex = noteBaseIds.get(note.toLower, -1);

  if (noteIndex == -1)
  {
    return invalidNoteId;
  }

  return NoteId((octave * 100) + noteIndex);
}
