/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songtrack;

/// Wrapper around a song track.
final class SongTrack
{
  private:

  public:
  final:
  this()
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
