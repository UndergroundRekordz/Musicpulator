/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.melodies;

import musicpulator.direction;
import musicpulator.musicalprogression;

/**
* Gets the melodic progression based on the analysis of a set of note directions.
* Params:
*   directions = The note directions to analuyze and get the progression of.
* Returns:
*   The melodic progression best fitting the analysis.
*/
MusicalProgression getProgression(NoteDirection[] directions)
{
  import std.algorithm : all;

  if (!directions || !directions.length)
  {
    return MusicalProgression.none;
  }

  if (directions.all!(d => d == NoteDirection.forward))
  {
    return MusicalProgression.steady;
  }

  if (directions.all!(d => d == NoteDirection.upwards))
  {
    return MusicalProgression.upwards;
  }

  if (directions.all!(d => d == NoteDirection.downwards))
  {
    return MusicalProgression.downwards;
  }

  // TODO: More analysis.

  return MusicalProgression.unknown;
}
