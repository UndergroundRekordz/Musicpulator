/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.direction;

import musicpulator.notes;

/// Enumeration of note directions.
enum NoteDirection
{
  /// An upwards note direction. Ex. C5 -> E5
  upwards,
  /// A downwards note direction. Ex. E5 -> D#5
  downwards,
  /// A forward note direction. Ex. G#5 -> G#5
  forward
}

/**
* Gets the direction of a note relative to another note.
* Params:
*   noteX = The first note.
*   noteY = The secondary note.
* Returns:
*   The direction in which noteX progresses to noteY.
*/
NoteDirection getNoteDirection(NoteId noteX, NoteId noteY)
{
  if (noteX.id == noteY.id)
  {
    return NoteDirection.forward;
  }
  else if (noteX.id > noteY.id)
  {
    return NoteDirection.downwards;
  }
  else
  {
    return NoteDirection.upwards;
  }
}

/**
* Gets all directions based on a set of note ids.
* Params:
*   noteIds = The ids of the notes to get the directions for.
* Returns:
*   An array of directions that the notes progress in.
*/
NoteDirection[] getNoteDirections(NoteId[] noteIds)
{
  NoteDirection[] directions;

  if (noteIds && noteIds.length)
  {
    foreach (i; 0 .. (noteIds.length - 1))
    {
      auto noteX = noteIds[i];
      auto noteY = noteIds[i + 1];

      directions ~= getNoteDirection(noteX, noteY);
    }
  }

  return directions;
}
