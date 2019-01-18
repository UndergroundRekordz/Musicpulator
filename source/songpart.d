/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songpart;

import std.algorithm : map, joiner;
import std.array : array, join;
import std.string : format;

import musicpulator.musicalscale;
import musicpulator.musicalprogression;
import musicpulator.songtrack;
import musicpulator.core;

/// Enumeration of song part titles.
enum SongPartTitle : string
{
  /// An outro.
  outro = "Outro",
  /// The first half of an outro.
  outroFirst = "Outro (First Half)",
  /// The second half of an outro.
  outroSecond = "Outro (Second Half)",
  /// An intro.
  intro = "Intro",
  /// The first half of an intro.
  introFirst = "Intro (First Half)",
  /// The second half of an intro.
  introSecond = "Intro (Second Half)",
  /// A verse.
  verse = "Verse",
  /// The first verse.
  verse1 = "Verse 1",
  /// The second verse.
  verse2 = "Verse 2",
  /// The third verse.
  verse3 = "Verse 3",
  /// The fourth verse.
  verse4 = "Verse 4",
  /// The first half of the first verse.
  verse1First = "Verse 1 (First Half)",
  /// The first half of the second verse.
  verse2First = "Verse 2 (First Half)",
  /// The first half of the third verse.
  verse3First = "Verse 3 (First Half)",
  /// The first half of the fourth verse.
  verse4First = "Verse 4 (First Half)",
  /// The second half of the first verse.
  verse1Second = "Verse 1 (Second Half)",
  /// The second half of the second verse.
  verse2Second = "Verse 2 (Second Half)",
  /// The second half of the third verse.
  verse3Second = "Verse 3 (Second Half)",
  /// The second half of the fouth verse.
  verse4Second = "Verse 4 (Second Half)",
  /// A chorus.
  chorus = "Chorus",
  /// The first chorus.
  chorus1 = "Chorus 1",
  /// The second chorus.
  chorus2 = "Chorus 2",
  /// The third chorus.
  chorus3 = "Chorus 3",
  /// The fourth chorus.
  chorus4 = "Chorus 4",
  /// The first half of the first chorus.
  chorus1First = "Chorus 1 (First Half)",
  /// The first half of the second chorus.
  chorus2First = "Chorus 2 (First Half)",
  /// The first half of the third chorus.
  chorus3First = "Chorus 3 (First Half)",
  /// The first half of the fourth chorus.
  chorus4First = "Chorus 4 (First Half)",
  /// The second half of the first chorus.
  chorus1Second = "Chorus 1 (Second Half)",
  /// The second half of the second chorus.
  chorus2Second = "Chorus 2 (Second Half)",
  /// The second half of third chorus.
  chorus3Second = "Chorus 3 (Second Half)",
  /// The second half of the fourth chorus.
  chorus4Second = "Chorus 4 (Second Half)",
  /// A bridge.
  bridge = "Bridge",
  /// The first bridge.
  bridge1 = "Bridge 1",
  /// The second bridge.
  bridge2 = "Bridge 2",
  /// The third bridge.
  bridge3 = "Bridge 3",
  /// The fourth bridge.
  bridge4 = "Bridge 4",
  /// A solo.
  solo = "Solo",
  /// The first solo.
  solo1 = "Solo 1",
  /// The second solo.
  solo2 = "Solo 2",
  /// The third solo.
  solo3 = "Solo 3",
  /// The fourth solo.
  solo4 = "Solo 4",
  /// The fifth solo.
  solo5 = "Solo 5",
  /// The sixth solo.
  solo6 = "Solo 6",
  /// The seventh solo.
  solo7 = "Solo 7",
  /// The eighth solo.
  solo8 = "Solo 8"
}

/// Wrapper around a song part.
final class SongPart
{
  private:
  /// The title of the song part.
  SongPartTitle _title;
  /// The bar of the song part.
  size_t _bar;
  /// The tracks of the song part.
  InternalCollection!SongTrack _tracks;

  public:
  final:
  /**
  * Creates a new song part.
  * Params:
  *   title = The title.
  */
  this(SongPartTitle title)
  {
    _title = title;
  }

  @property
  {
    /// Gets the title of the song part.
    SongPartTitle title() { return _title; }

    /// Gets the bar of the song part.
    size_t bar() { return _bar; }

    /// Sets the bar of the song part.
    void bar(size_t newBar)
    {
      _bar = newBar;
    }

    /// Gets the tracks of the song part.
    InternalCollection!SongTrack tracks() { return _tracks; }
  }

  /**
  * Adds a track to the song part.
  * Params:
  *   track = The track to add.
  */
  void addTrack(SongTrack track)
  {
    if (!track)
    {
      return;
    }

    track.parentPart = this;

    _tracks.add(track);
  }

  /// Converts the song part to string. Calls toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the song part to json.
  string toJson()
  {
    auto tracksJson = "[";

    if (_tracks.length)
    {
      foreach (track; _tracks)
      {
        tracksJson ~= track.toJson() ~ ",";
      }

      tracksJson.length -= 1;
    }

    tracksJson ~= "]";

    return `{"tracks":%s,"title": "%s", "bar": %d}`
      .format(tracksJson, cast(string)_title, _bar);
  }

  /// Converts the song part to xml.
  string toXml()
  {
    auto tracksXml = "";

    if (_tracks.length)
    {
      tracksXml = _tracks.map!(t => t.toXml()).array.join;
    }

    return `<SongPart title="%s" bar="%d">%s</SongPart>`
      .format(cast(string)_title, _bar, tracksXml);
  }
}
