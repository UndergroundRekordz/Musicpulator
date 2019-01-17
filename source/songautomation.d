/**
* Copyright © Underground Rekordz 2019
* License: MIT (https://github.com/UndergroundRekordz/Musicpulator/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module musicpulator.songautomation;

import std.string : format;
import std.algorithm : map;
import std.traits : isNumeric;
import std.array : join, array;

import musicpulator.core;

/// Wrapper around a song automation.
final class SongAutomation(T)
if (isNumeric!T)
{
  private:
  /// The name of the automation.
  string _name;
  /// The values of the automation.
  InternalMaxSizeCollection!(T, 32) _values;

  public:
  /**
  * Creates a new song automation.
  * Params:
  *   name =      The name of the automation.
  *   initValue = The initial value of the automation.
  */
  this(string name, T initValue = T.init)
  {
    _name = name;

    _values.add(initValue);
  }

  @property
  {
    /// Gets the name.
    string name() { return _name; }

    /// Sets the name of the automation.
    void name(string newName)
    {
      _name = newName;
    }

    /// Gets the values of the automation.
    InternalMaxSizeCollection!(T, 32) values() { return _values; }

    /// Gets the base value of the automation.
    T value() { return _values[0]; }

    /// Sets the base value of the automation.
    void value(T newValue)
    {
      _values[0] = newValue;
    }
  }

  /**
  * Adds a value to the automation.
  * Params:
  *   value = The value to add.
  */
  void addValue(T value)
  {
    _values.add(value);
  }

  /**
  * Modifies an automation point.
  * Params:
  *   value =           The new value of the automation point.
  *   automationPoint = The point to modify.
  */
  void modifyValue(T value, size_t automationPoint)
  {
    if (automationPoint < _values.length)
    {
      _values[automationPoint] = value;
    }
  }

  /// Converts the automation to a string. This will call toJson().
  override string toString()
  {
    return toJson();
  }

  /// Converts the automation to json.
  string toJson()
  {
    return `{"name":"%s","value":%s,"values":%s}`
      .format(_name ? _name : "null", value, values);
  }

  /// Converts the automation to xml.
  string toXml()
  {
    return `<SongAutomation name="%s" value="%s">%s</SongAutomation>`.
      format(_name, value, values.map!(v => "<SongAutomationValue>%s</SongAutomationValue>".format(v)).array.join);
  }
}
