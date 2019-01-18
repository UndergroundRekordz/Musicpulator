/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.song;

import std.string : format;

import musicpulator.songpart;
import musicpulator.musicalscale;
import musicpulator.musicalprogression;

/// Wrapper around a song.
final class Song
{
  private:
  /// The name.
  string _name;

  /// The parts of the song.
  SongPart[SongPartTitle] _parts;

  public:
  final:
  /// Creates a new song.
  this(string name)
  {
    _name = name;
  }

  @property
  {
    /// Gets the parts of a song.
    auto parts() { return _parts.values; }
  }

  /**
  * Adds a part to the song.
  * Params:
  *   part = The part.
  */
  void addPart(SongPart part)
  {
    if (!part)
    {
      return;
    }

    _parts[part.title] = part;
  }

  /**
  * Gets a part from the song.
  * Params:
  *   title = The title of the part to get.
  * Returns:
  *   The part if existing, null otherwise.
  */
  SongPart getPart(SongPartTitle title)
  {
    return _parts ? _parts.get(title, null) : null;
  }

  /// Converts the song to string. Calls toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the song to json.
  string toJson()
  {
    auto partsJson = "[";

    if (_parts && _parts.length)
    {
      foreach (k,v; _parts)
      {
        partsJson ~= v.toJson() ~ ",";
      }

      partsJson.length -= 1;
    }

    partsJson ~= "]";

    return `{"name":"%s","parts": %s}`
      .format(_name ? _name : "", partsJson);
  }

  /// Converts the song to xml.
  string toXml()
  {
    auto partsXml = "";

    if (_parts && _parts.length)
    {
      foreach (k,v; _parts)
      {
        partsXml ~= v.toXml();
      }
    }

    return `<Song name="%s">%s</Song>`
      .format(_name, partsXml);
  }
}
