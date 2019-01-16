/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.song;

import musicpulator.songpart;
import musicpulator.musicalscale;
import musicpulator.musicalprogression;

/// Wrapper around a song.
final class Song
{
  private:
  SongPart[SongPartTitle] _parts;

  public:
  final:
  this()
  {

  }

  void addPart(SongPartTitle title, SongPart part)
  {
    _parts[title] = part;
  }

  SongPart getPart(SongPartTitle title)
  {
    return _parts ? _parts.get(title, null) : null;
  }

  MusicalScale[] getScales()
  {
    MusicalScale[] scales;

    if (_parts && _parts.length)
    {
      foreach (part; _parts.values)
      {
        scales ~= part.getScales();
      }
    }

    return scales;
  }

  MusicalProgression[] getProgressions()
  {
    MusicalProgression[] progressions;

    if (_parts && _parts.length)
    {
      foreach (part; _parts.values)
      {
        progressions ~= part.getProgressions();
      }
    }

    return progressions;
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
