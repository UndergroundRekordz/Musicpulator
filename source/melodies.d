/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.melodies;

import musicpulator.direction;

/// Enumeration of melody progressions.
enum MelodyProgression
{
  /// There is no progression.
  none,
  /// The progress is unknown or does not fit a specific progression.
  unknown,
  /// The melody progresses upwards.
  upwards,
  /// The melody progresses downwards.
  downwards,
  /// The melody progresses up-downwards.
  upDownwards,
  /// The melody progresses down-upwards.
  downUpwards,
  /// The melody is swinging upwards.
  swingingUpwards,
  /// The melody is swinging downwards.
  swingingDownwards,
  /// The melody is steady.
  steady,
  /// The melody has a steady swinging.
  steadySwing,
  /// The melody is swinging upwards.
  upSwing,
  /// The melody is swinging downwards.
  downSwing
}

/**
* Gets the melodic progression based on the analysis of a set of note directions.
* Params:
*   directions = The note directions to analuyze and get the progression of.
* Returns:
*   The melodic progression best fitting the analysis.
*/
MelodyProgression getProgression(NoteDirection[] directions)
{
  import std.algorithm : all;
  
  if (!directions || !directions.length)
  {
    return MelodyProgression.none;
  }

  if (directions.all!(d => d == NoteDirection.forward))
  {
    return MelodyProgression.steady;
  }

  if (directions.all!(d => d == NoteDirection.upwards))
  {
    return MelodyProgression.upwards;
  }

  if (directions.all!(d => d == NoteDirection.downwards))
  {
    return MelodyProgression.downwards;
  }

  // TODO: More analysis.

  return MelodyProgression.unknown;
}
