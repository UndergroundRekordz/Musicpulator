/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.tools;

import musicpulator.musicalnote;
import musicpulator.musicalscale;

/**
* Converts a note into its respective flat note with a proper scale.
* Params:
*   note = The note to convert.
* Returns:
*   The respective flat note if any, otherwise the note itself.
*/
MusicalNote convertToFlatNote(MusicalNote note)
{
  switch (note)
  {
    case MusicalNote.cSharp:
      return MusicalNote.dFlat;

    case MusicalNote.dSharp:
      return MusicalNote.eFlat;

    case MusicalNote.fSharp:
      return MusicalNote.gFlat;

    case MusicalNote.gSharp:
      return MusicalNote.aFlat;

    case MusicalNote.aSharp:
      return MusicalNote.bFlat;

    case MusicalNote.b:
      return MusicalNote.cFlat;

    default:
      return note;
  }
}

/**
* Converts a note from its respective flat note with a proper scale.
* Params:
*   note = The note to convert.
* Returns:
*   The note converted from its respective flat note if any, otherwise the note itself.
*/
MusicalNote convertFromFlatNote(MusicalNote note)
{
  switch (note)
  {
    case MusicalNote.dFlat:
      return MusicalNote.cSharp;

    case MusicalNote.eFlat:
      return MusicalNote.dSharp;

    case MusicalNote.gFlat:
      return MusicalNote.fSharp;

    case MusicalNote.aFlat:
      return MusicalNote.gSharp;

    case MusicalNote.bFlat:
      return MusicalNote.aSharp;

    case MusicalNote.cFlat:
      return MusicalNote.b;

    default:
      return note;
  }
}

/**
* Translate a set of notes into their respective flat notes.
* Params:
*   notes = The notes.
* Returns:
*   A new set of notes with the respective flat notes.
*/
MusicalNote[] translateToFlatNotes(MusicalNote[] notes)
{
  MusicalNote[] newNotes;

  if (notes && notes.length)
  {
    foreach (note; notes)
    {
      newNotes ~= convertToFlatNote(note);
    }
  }

  return newNotes;
}

/**
* Translate a set of notes from their respective flat notes.
* Params:
*   notes = The notes.
* Returns:
*   A new set of notes translated from their respective flat notes.
*/
MusicalNote[] translateFromFlatNotes(MusicalNote[] notes)
{
  MusicalNote[] newNotes;

  if (notes && notes.length)
  {
    foreach (note; notes)
    {
      newNotes ~= convertFromFlatNote(note);
    }
  }

  return newNotes;
}

/**
* Converts a note into its respective flat note with a proper scale.
* Params:
*   note = The note to convert.
* Returns:
*   The respective flat note if any, otherwise the note itself.
*/
MusicalScaleNote convertToFlatNote(MusicalScaleNote note)
{
  switch (note.note)
  {
    case MusicalNote.cSharp:
      return new MusicalScaleNote(MusicalNote.dFlat, note.octaveIncrementer);

    case MusicalNote.dSharp:
      return new MusicalScaleNote(MusicalNote.eFlat, note.octaveIncrementer);

    case MusicalNote.fSharp:
      return new MusicalScaleNote(MusicalNote.gFlat, note.octaveIncrementer);

    case MusicalNote.gSharp:
      return new MusicalScaleNote(MusicalNote.aFlat, note.octaveIncrementer);

    case MusicalNote.aSharp:
      return new MusicalScaleNote(MusicalNote.bFlat, note.octaveIncrementer);

    case MusicalNote.b:
      return new MusicalScaleNote(MusicalNote.cFlat, note.octaveIncrementer);

    default:
      return new MusicalScaleNote(note.note, note.octaveIncrementer);
  }
}

/**
* Converts a note from its respective flat note with a proper scale.
* Params:
*   note = The note to convert.
* Returns:
*   The note converted from its respective flat note if any, otherwise the note itself.
*/
MusicalScaleNote convertFromFlatNote(MusicalScaleNote note)
{
  switch (note.note)
  {
    case MusicalNote.dFlat:
      return new MusicalScaleNote(MusicalNote.cSharp, note.octaveIncrementer);

    case MusicalNote.eFlat:
      return new MusicalScaleNote(MusicalNote.dSharp, note.octaveIncrementer);

    case MusicalNote.gFlat:
      return new MusicalScaleNote(MusicalNote.fSharp, note.octaveIncrementer);

    case MusicalNote.aFlat:
      return new MusicalScaleNote(MusicalNote.gSharp, note.octaveIncrementer);

    case MusicalNote.bFlat:
      return new MusicalScaleNote(MusicalNote.aSharp, note.octaveIncrementer);

    case MusicalNote.cFlat:
      return new MusicalScaleNote(MusicalNote.b, note.octaveIncrementer);

    default:
      return new MusicalScaleNote(note.note, note.octaveIncrementer);
  }
}

/**
* Translate a set of notes into their respective flat notes.
* Params:
*   notes = The notes.
* Returns:
*   A new set of notes with the respective flat notes.
*/
MusicalScaleNote[] translateToFlatNotes(MusicalScaleNote[] notes)
{
  MusicalScaleNote[] newNotes;

  if (notes && notes.length)
  {
    foreach (note; notes)
    {
      newNotes ~= convertToFlatNote(note);
    }
  }

  return newNotes;
}

/**
* Translate a set of notes from their respective flat notes.
* Params:
*   notes = The notes.
* Returns:
*   A new set of notes translated from their respective flat notes.
*/
MusicalScaleNote[] translateFromFlatNotes(MusicalScaleNote[] notes)
{
  MusicalScaleNote[] newNotes;

  if (notes && notes.length)
  {
    foreach (note; notes)
    {
      newNotes ~= convertFromFlatNote(note);
    }
  }

  return newNotes;
}

/**
* Translates a scale note into a natural note.
* Params:
*   scaleNote = The scale note to translate.
* Returns:
*   The natural note relative to the scale note.
*/
MusicalNote translateToNaturalNote(MusicalScaleNote scaleNote)
{
  return scaleNote.note;
}

/**
* Translates a set of scale notes into a set of natural notes.
* Params:
*   scaleNotes = The scale notes to translate.
* Returns:
*   The set of natural notes relative to the scale notes.
*/
MusicalNote[] translateToNaturalNotes(MusicalScaleNote[] scaleNotes)
{
  MusicalNote[] notes;

  if (scaleNotes && scaleNotes.length)
  {
    foreach (scaleNote; scaleNotes)
    {
      notes ~= translateToNaturalNote(scaleNote);
    }
  }

  return notes;
}

/**
* Gets the musical scale based on its scale name.
*/
MusicalScale getScale(MusicalScaleName scaleName)
{
  import std.array : split;

  auto data = (cast(string)scaleName).split(" ");
  auto note = cast(MusicalNote)data[0];
  auto type = cast(MusicalScaleType)data[1];

  return new MusicalScale(scaleName, note, type);
}

/**
* Finds the best matching scales based on a set of given notes.
* Params:
*   notes =          The notes to match into a scale.
*   unorderedMatch = Boolean determining whether the matching is unordered or not. This is false by default.
*/
MusicalScale[] findScales(MusicalNote[] notes, bool unorderedMatch = false)
{
  import std.traits : EnumMembers;
  import std.algorithm : canFind;

  if (!notes || !notes.length)
  {
    return null;
  }

  bool[MusicalNote] noteMap;
  MusicalNote[] uniqueNotes;

  foreach (note; notes)
  {
    if (!noteMap || note !in noteMap)
    {
      uniqueNotes ~= note;

      noteMap[note] = true;
    }
  }

  notes = uniqueNotes;

  MusicalScale[] currentMatch;
  size_t currentMatchingNotes;

  static foreach (scaleName; [EnumMembers!MusicalScaleName])
  {{
    auto scale = getScale(scaleName);

    if (scale)
    {
      auto scaleNotes = scale.getNaturalNotes();
      size_t matching;

      if (unorderedMatch)
      {
        foreach (note; notes)
        {
          if (scaleNotes.canFind(note))
          {
            matching++;
          }
        }
      }
      else
      {
        auto length = notes.length > scaleNotes.length ? scaleNotes.length : notes.length;

        foreach (i; 0 .. length)
        {
          if (scaleNotes[i] != notes[i])
          {
            break;
          }
          else
          {
            matching++;
          }
        }
      }

      if (matching > currentMatchingNotes)
      {
        currentMatch = [scale];
        currentMatchingNotes = matching;
      }
      else if (matching == currentMatchingNotes)
      {
        currentMatch ~= scale;
      }
    }
  }}

  return currentMatch;
}
