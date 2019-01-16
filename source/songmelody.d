/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songmelody;

import musicpulator.songnote;
import musicpulator.musicalscale;

/// Wrapper around a song melody.
final class SongMelody
{
  private:
  MusicalScale _scale;

  public:
  final:
  this()
  {

  }

  @property
  {

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
