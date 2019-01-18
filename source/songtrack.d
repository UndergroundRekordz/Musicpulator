/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songtrack;

import std.string : format;
import std.conv : to;

import musicpulator.songautomation;
import musicpulator.songchord;
import musicpulator.songmelody;
import musicpulator.songsequence;
import musicpulator.songpart;
import musicpulator.musicalscale;
import musicpulator.musicalprogression;

/// Alias for a float automation.
private alias FloatAutomation = SongAutomation!float;

/// Wrapper around a song track.
final class SongTrack
{
  private:
  /// The chord of the track.
  SongChord _chord;
  /// The melody of the track.
  SongMelody _melody;
  /// The sequence of the track.
  SongSequence _sequence;

  /// The name of the track.
  string _name;
  /// The bar of the track.
  size_t _bar;
  /// The volume of the track.
  FloatAutomation _volume;
  /// The velocity of the track.
  FloatAutomation _velocity;
  /// The dryness of the track.
  FloatAutomation _dry;
  /// The wetness of the track.
  FloatAutomation _wet;
  /// The metadata.
  string[string] _metaData;
  /// The meta-automation.
  FloatAutomation[string] _metaAutomation;
  /// The parent part.
  SongPart _parentPart;

  this()
  {
    _volume = new FloatAutomation("Volume", 1);
    _velocity = new FloatAutomation("Velocity", 0.8);
    _dry = new FloatAutomation("Dry", 0);
    _wet = new FloatAutomation("Wet", 0);
  }

  public:
  final:
  /**
  * Creates a new track.
  * Params:
  *   chord = The chord.
  */
  this(SongChord chord)
  {
    this();

    _chord = chord;
  }

  /**
  * Creates a new track.
  * Params:
  *   melody = The melody.
  */
  this(SongMelody melody)
  {
    this();

    _melody = melody;
  }

  /**
  * Creates a new track.
  * Params:
  *   sequence = The sequence.
  */
  this(SongSequence sequence)
  {
    this();

    _sequence = sequence;
  }

  @property
  {
    /// Gets the chord.
    SongChord chord() { return _chord; }

    /// Sets the chord. This will nullify the melody and sequence if any.
    void chord(SongChord newChord)
    {
      if (!newChord)
      {
        return;
      }

      _melody = null;
      _sequence = null;

      _chord = newChord;
    }

    /// Gets the melody.
    SongMelody melody() { return _melody; }

    /// Sets the melody. This will nullify the chord and sequence if any.
    void melody(SongMelody newMelody)
    {
      if (!newMelody)
      {
        return;
      }

      _chord = null;
      _sequence = null;

      _melody = newMelody;
    }

    /// Gets the sequence.
    SongSequence sequence() { return _sequence; }

    /// Sets the sequence. This will nullify the chord and melody if any.
    void sequence(SongSequence newSequence)
    {
      if (!newSequence)
      {
        return;
      }

      _chord = null;
      _melody = null;

      _sequence = newSequence;
    }

    /// Gets the name of the track.
    string name() { return _name; }

    /// Sets the name of the track.
    void name(string newName)
    {
      _name = newName;
    }

    /// Gets the bar of the track.
    size_t bar() { return _bar; }

    /// Gets the relative bar.
    size_t relativeBar()
    {
      if (_parentPart)
      {
        return _parentPart.bar + _bar;
      }

      return _bar;
    }

    /// Sets the bar of the track.
    void bar(size_t newBar)
    {
      _bar = newBar;
    }

    /// Gets the volume of the track.
    FloatAutomation volume() { return _volume; }

    /// Gets the velocity of the track.
    FloatAutomation velocity() { return _velocity; }

    /// Gets the dryness of the track.
    FloatAutomation dry() { return _dry; }

    /// Gets the wetness of the track.
    FloatAutomation wet() { return _wet; }

    /// Gets the scales of the track.
    const(MusicalScale[][]) scales()
    {
      if (_chord) return _chord.scales;
      else if (_melody) return [_melody.scales];
      else return null;
    }

    /// Gets the progression of the track.
    MusicalProgression progression()
    {
      if (!_melody) return MusicalProgression.none;

      return _melody.progression;
    }

    /// Gets the parent part.
    SongPart parentPart() { return _parentPart; }

    package(musicpulator)
    {
      /// Sets the parent part.
      void parentPart(SongPart newPart)
      {
        _parentPart = newPart;
      }
    }
  }

  /**
  * Sets metadata of the track.
  * Params:
  *   key =   The key of the metadata.
  *   value = The value of the metadata.
  */
  void setMetaData(T)(string key, T value)
  {
    _metaData[key] = to!string(value);
  }

  /**
  * Gets metadata from the track.
  * Params:
  *   key = The key of the metadata to retrieve.
  * Returns:
  *   The metadata if existing, null otherwise.
  */
  T getMetaData(T = string)(string key)
  {
    if (key !in _metaData)
    {
      return T.init;
    }

    auto value = _metaData.get(key, T.init);

    return to!T(value);
  }

  /**
  * Sets the meta-automation of  the track.
  * Params:
  *   key =             The key of the meta-automation.
  *   value =           The value of the automation point.
  *   automationPoint = The automation point to the set the value at.
  */
  void setMetaAutomation(string key, float value, size_t automationPoint)
  {
    if (automationPoint >= 32)
    {
      return;
    }

    auto automation = _metaAutomation.get(key, null);

    if (!automation)
    {
      automation = new FloatAutomation(key, value);
      _metaAutomation[key] = automation;
    }
    else
    {
      automation.modifyValue(value, automationPoint);
    }
  }

  /**
  * Gets a meta automation.
  * Params:
  *   key = The key of the meta-automation to retrieve.
  * Returns:
  *   The meta-automation if found, null otherwise.
  */
  FloatAutomation getMetaAutomation(string key)
  {
    return _metaAutomation.get(key, null);
  }

  /// Converts the song track to a string. Calls toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the song track to json.
  string toJson()
  {
    string metaDataEntry = "null";

    if (_metaData && _metaData.length)
    {
      metaDataEntry = "{";

      foreach (k,v; _metaData)
      {
        metaDataEntry ~= `"%s":"%s",`.format(k,v);
      }

      metaDataEntry.length -= 1;
      metaDataEntry ~= "}";
    }

    string metaAutomationEntry = "null";

    if (_metaAutomation && _metaAutomation.length)
    {
      metaAutomationEntry = "{";

      foreach (k,v; _metaAutomation)
      {
        metaAutomationEntry ~= `"%s":%s,`.format(k,v.toJson());
      }

      metaAutomationEntry.length -= 1;
      metaAutomationEntry ~= "}";
    }

    return `{"chord":%s,"melody":%s,"sequence":%s,"name":%s,"bar":%d,"relativeBar":%d,"volume":%s,"velocity":%s,"dry":%s,"wet":%s,"metaData":%s,"metaAutomation":%s}`
      .format(
        _chord ? _chord.toJson() : "null",
        _melody ? _melody.toJson() : "null",
        _sequence ? _sequence.toJson() : "null",
        _name ? ("\"" ~ _name ~ "\"") : "null", _bar, relativeBar,
        _volume.toJson(), _velocity.toJson(),
        _dry.toJson(), _wet.toJson(),
        metaDataEntry, metaAutomationEntry
      );
  }

  /// Converts the song track to xml.
  string toXml()
  {
    string metaDataEntry = "";

    if (_metaData && _metaData.length)
    {
      metaDataEntry = "<SongMetaData>";

      foreach (k,v; _metaData)
      {
        metaDataEntry ~= `<SongMetaDataEntry key="%s" value="%s" />`.format(k,v);
      }

      metaDataEntry ~= "</SongMetaData>";
    }

    string metaAutomationEntry = "null";

    if (_metaAutomation && _metaAutomation.length)
    {
      metaAutomationEntry = "<SongMetaAutomation>";

      foreach (k,v; _metaAutomation)
      {
        metaAutomationEntry ~= v.toXml();
      }

      metaAutomationEntry ~= "</SongMetaAutomation>";
    }

    return `<SongTrack name="%s" bar="%d" relativeBar="%d">%s%s%s %s%s%s%s %s %s</SongTrack>`
      .format(
        _name ? _name : "", _bar, relativeBar,
        _chord ? _chord.toXml() : "",
        _melody ? _melody.toXml() : "",
        _sequence ? _sequence.toXml() : "",
        _volume.toXml(), _velocity.toXml(),
        _dry.toXml(), _wet.toXml(),
        metaDataEntry, metaAutomationEntry
      );
  }
}
