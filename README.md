# Musicpulator

Musicpulator is a music analyzation and manipulation library written in D.

It can be used to analyze musical scores for their scales, chords, progressions.

It can also be used to manipulate scores.

**Musicpulator** is maintained by [**Underground Rekordz**](https://undergroundrekordz.com)

Currently only manual analyzation is available, but in the future more sophisticated analyzation will be available.

Musicpulator is the new library behind an AI used at **Underground Rekordz** called **Melodyc**.

You can read about **Melodyc** here:

https://cooldown.io/blogs/entry/2-using-artificial-intelligence-to-create-beautiful-music-part-1/

https://cooldown.io/blogs/entry/3-using-artificial-intelligence-to-create-beautiful-music-part-2/

## Installation

Musicpulator is available using DUB.

Simply add the following to your dub.json (Or the equivalent in dub.sdl)

```
"dependencies": {
		"musicpulator": "~>0.0.2"
}
```

## Contributing

If you wish to contribute to the project simply follow these steps:

1. Fork the project
2. Make your modifications/additions
3. Create a pull-request

Please keep pull-requests to a single change and follow the coding style as much as you can.

All contributions are appreciated.

## Issues / Help

Head over to our [**Issue Tab**](https://github.com/UndergroundRekordz/Musicpulator/issues) if you need help, got questions or have any issues with Musicpulator.

## Example Program

```
module main;

import std.file : write;

import musicpulator;

void main()
{
  auto chord = new SongChord(4,1,1);

  auto chordEntry = new SongChordEntry
  (
    16,
    2,
    [
        new SongNote(MusicalNote.a, 8, 0,5, 0),
        new SongNote(MusicalNote.e, 8, 8, 5, 0),
        new SongNote(MusicalNote.cSharp, 8, 16, 5, 0),
        new SongNote(MusicalNote.b, 8, 24, 4, 0)
    ],
    chord
  );

  chord.addChordEntry(chordEntry);

  auto sequence = new SongSequence(MusicalNote.eFlat, 10, 5, [2,4,8,99]);

  auto track = new SongTrack(sequence);
  track.setMetaData("bpm", 140);
  track.setMetaAutomation("bpm", 0.5, 0);
  track.velocity.value = 0.6;
  track.wet.addValue(0.7);
  track.wet.addValue(0.75);

  auto part = new SongPart(SongPartTitle.chorus);
  part.addTrack(track);
  part.addTrack(track);
  part.addTrack(track);

  auto tack2 = new SongTrack(chord);
  tack2.name = "Strings";
  tack2.wet.addValue(0.5);
  tack2.wet.addValue(0.7);
  tack2.wet.addValue(0.8);
  tack2.velocity.addValue(0.5);
  tack2.velocity.addValue(0.75);
  part.addTrack(tack2);

  auto song = new Song("My song");
  song.addPart(part);

  write("test.json", song.toJson());
  write("test.xml", song.toXml());
}
```

### Json Result:

```
{
   "name":"My song",
   "parts":[
      {
         "tracks":[
            {
               "chord":null,
               "melody":null,
               "sequence":{
                  "note":"Eb",
                  "bar":10,
                  "octave":5,
                  "sequenceEntry":[
                     2,
                     4,
                     8,
                     18
                  ]
               },
               "name":null,
               "bar":0,
               "relativeBar":0,
               "volume":{
                  "name":"Volume",
                  "value":1,
                  "values":[
                     1
                  ]
               },
               "velocity":{
                  "name":"Velocity",
                  "value":0.6,
                  "values":[
                     0.6
                  ]
               },
               "dry":{
                  "name":"Dry",
                  "value":0,
                  "values":[
                     0
                  ]
               },
               "wet":{
                  "name":"Wet",
                  "value":0,
                  "values":[
                     0,
                     0.7,
                     0.75
                  ]
               },
               "metaData":{
                  "bpm":"140"
               },
               "metaAutomation":{
                  "bpm":{
                     "name":"bpm",
                     "value":0.5,
                     "values":[
                        0.5
                     ]
                  }
               }
            },
            {
               "chord":null,
               "melody":null,
               "sequence":{
                  "note":"Eb",
                  "bar":10,
                  "octave":5,
                  "sequenceEntry":[
                     2,
                     4,
                     8,
                     18
                  ]
               },
               "name":null,
               "bar":0,
               "relativeBar":0,
               "volume":{
                  "name":"Volume",
                  "value":1,
                  "values":[
                     1
                  ]
               },
               "velocity":{
                  "name":"Velocity",
                  "value":0.6,
                  "values":[
                     0.6
                  ]
               },
               "dry":{
                  "name":"Dry",
                  "value":0,
                  "values":[
                     0
                  ]
               },
               "wet":{
                  "name":"Wet",
                  "value":0,
                  "values":[
                     0,
                     0.7,
                     0.75
                  ]
               },
               "metaData":{
                  "bpm":"140"
               },
               "metaAutomation":{
                  "bpm":{
                     "name":"bpm",
                     "value":0.5,
                     "values":[
                        0.5
                     ]
                  }
               }
            },
            {
               "chord":null,
               "melody":null,
               "sequence":{
                  "note":"Eb",
                  "bar":10,
                  "octave":5,
                  "sequenceEntry":[
                     2,
                     4,
                     8,
                     18
                  ]
               },
               "name":null,
               "bar":0,
               "relativeBar":0,
               "volume":{
                  "name":"Volume",
                  "value":1,
                  "values":[
                     1
                  ]
               },
               "velocity":{
                  "name":"Velocity",
                  "value":0.6,
                  "values":[
                     0.6
                  ]
               },
               "dry":{
                  "name":"Dry",
                  "value":0,
                  "values":[
                     0
                  ]
               },
               "wet":{
                  "name":"Wet",
                  "value":0,
                  "values":[
                     0,
                     0.7,
                     0.75
                  ]
               },
               "metaData":{
                  "bpm":"140"
               },
               "metaAutomation":{
                  "bpm":{
                     "name":"bpm",
                     "value":0.5,
                     "values":[
                        0.5
                     ]
                  }
               }
            },
            {
               "chord":{
                  "bar":4,
                  "positiveHarmonics":1,
                  "negativeHarmonics":1,
                  "chordEntries":{
                     "notes":[
                        {
                           "note":"A",
                           "length":16,
                           "step":0,
                           "relativeStep":192,
                           "octave":5,
                           "bar":6
                        },
                        {
                           "note":"E",
                           "length":16,
                           "step":8,
                           "relativeStep":200,
                           "octave":5,
                           "bar":6
                        },
                        {
                           "note":"C#",
                           "length":16,
                           "step":16,
                           "relativeStep":208,
                           "octave":5,
                           "bar":6
                        },
                        {
                           "note":"B",
                           "length":16,
                           "step":24,
                           "relativeStep":216,
                           "octave":4,
                           "bar":6
                        }
                     ],
                     "scales":[
                        {
                           "scale":"aMajor",
                           "note":"a",
                           "type":"major",
                           "notes":[
                              {
                                 "note":"A",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"B",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"C#",
                                 "octaveIncrementer":1
                              },
                              {
                                 "note":"D",
                                 "octaveIncrementer":1
                              },
                              {
                                 "note":"E",
                                 "octaveIncrementer":1
                              },
                              {
                                 "note":"F#",
                                 "octaveIncrementer":1
                              },
                              {
                                 "note":"G#",
                                 "octaveIncrementer":1
                              }
                           ]
                        },
                        {
                           "scale":"aMinor",
                           "note":"a",
                           "type":"minor",
                           "notes":[
                              {
                                 "note":"A",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"B",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"C",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"D",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"E",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"F",
                                 "octaveIncrementer":0
                              },
                              {
                                 "note":"G",
                                 "octaveIncrementer":0
                              }
                           ]
                        }
                     ],
                     "length":16,
                     "bar":6
                  }
               },
               "melody":null,
               "sequence":null,
               "name":"Strings",
               "bar":0,
               "relativeBar":0,
               "volume":{
                  "name":"Volume",
                  "value":1,
                  "values":[
                     1
                  ]
               },
               "velocity":{
                  "name":"Velocity",
                  "value":0.8,
                  "values":[
                     0.8,
                     0.5,
                     0.75
                  ]
               },
               "dry":{
                  "name":"Dry",
                  "value":0,
                  "values":[
                     0
                  ]
               },
               "wet":{
                  "name":"Wet",
                  "value":0,
                  "values":[
                     0,
                     0.5,
                     0.7,
                     0.8
                  ]
               },
               "metaData":null,
               "metaAutomation":null
            }
         ],
         "title":"Chorus",
         "bar":0
      }
   ]
}
```

### XML Result:

```
<Song name="My song">
    <SongPart title="Chorus" bar="0">
        <SongTrack name="" bar="0" relativeBar="0">
            <SongSequence note="eFlat" bar="10" octave="5">
                <SequenceEntry length="2" />
                <SequenceEntry length="4" />
                <SequenceEntry length="8" />
                <SequenceEntry length="18" />
            </SongSequence>
            <SongAutomation name="Volume" value="1">
                <SongAutomationValue>1</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Velocity" value="0.6">
                <SongAutomationValue>0.6</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Dry" value="0">
                <SongAutomationValue>0</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Wet" value="0">
                <SongAutomationValue>0</SongAutomationValue>
                <SongAutomationValue>0.7</SongAutomationValue>
                <SongAutomationValue>0.75</SongAutomationValue>
            </SongAutomation>
            <SongMetaData>
                <SongMetaDataEntry key="bpm" value="140" />
            </SongMetaData>
            <SongMetaAutomation>
                <SongAutomation name="bpm" value="0.5">
                    <SongAutomationValue>0.5</SongAutomationValue>
                </SongAutomation>
            </SongMetaAutomation>
        </SongTrack>
        <SongTrack name="" bar="0" relativeBar="0">
            <SongSequence note="eFlat" bar="10" octave="5">
                <SequenceEntry length="2" />
                <SequenceEntry length="4" />
                <SequenceEntry length="8" />
                <SequenceEntry length="18" />
            </SongSequence>
            <SongAutomation name="Volume" value="1">
                <SongAutomationValue>1</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Velocity" value="0.6">
                <SongAutomationValue>0.6</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Dry" value="0">
                <SongAutomationValue>0</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Wet" value="0">
                <SongAutomationValue>0</SongAutomationValue>
                <SongAutomationValue>0.7</SongAutomationValue>
                <SongAutomationValue>0.75</SongAutomationValue>
            </SongAutomation>
            <SongMetaData>
                <SongMetaDataEntry key="bpm" value="140" />
            </SongMetaData>
            <SongMetaAutomation>
                <SongAutomation name="bpm" value="0.5">
                    <SongAutomationValue>0.5</SongAutomationValue>
                </SongAutomation>
            </SongMetaAutomation>
        </SongTrack>
        <SongTrack name="" bar="0" relativeBar="0">
            <SongSequence note="eFlat" bar="10" octave="5">
                <SequenceEntry length="2" />
                <SequenceEntry length="4" />
                <SequenceEntry length="8" />
                <SequenceEntry length="18" />
            </SongSequence>
            <SongAutomation name="Volume" value="1">
                <SongAutomationValue>1</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Velocity" value="0.6">
                <SongAutomationValue>0.6</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Dry" value="0">
                <SongAutomationValue>0</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Wet" value="0">
                <SongAutomationValue>0</SongAutomationValue>
                <SongAutomationValue>0.7</SongAutomationValue>
                <SongAutomationValue>0.75</SongAutomationValue>
            </SongAutomation>
            <SongMetaData>
                <SongMetaDataEntry key="bpm" value="140" />
            </SongMetaData>
            <SongMetaAutomation>
                <SongAutomation name="bpm" value="0.5">
                    <SongAutomationValue>0.5</SongAutomationValue>
                </SongAutomation>
            </SongMetaAutomation>
        </SongTrack>
        <SongTrack name="Strings" bar="0" relativeBar="0">
            <SongChord bar="4" positiveHarmonics="1" negativeHarmonics="1">
                <SongChordEntry length="16" bar="6">
                    <SongNotes>
                        <SongNote note="A" length="16" step="0" relativeStep="192" octave="5" bar="6" />
                        <SongNote note="E" length="16" step="8" relativeStep="200" octave="5" bar="6" />
                        <SongNote note="C#" length="16" step="16" relativeStep="208" octave="5" bar="6" />
                        <SongNote note="B" length="16" step="24" relativeStep="216" octave="4" bar="6" />
                    </SongNotes>
                    <Scales>
                        <MusicalScale scale="aMajor" note="a" type="major">
                            <ScaleNotes>
                                <ScaleNote note="A" octaveIncrementer="0" />
                                <ScaleNote note="B" octaveIncrementer="0" />
                                <ScaleNote note="C#" octaveIncrementer="1" />
                                <ScaleNote note="D" octaveIncrementer="1" />
                                <ScaleNote note="E" octaveIncrementer="1" />
                                <ScaleNote note="F#" octaveIncrementer="1" />
                                <ScaleNote note="G#" octaveIncrementer="1" />
                            </ScaleNotes>
                        </MusicalScale>
                        <MusicalScale scale="aMinor" note="a" type="minor">
                            <ScaleNotes>
                                <ScaleNote note="A" octaveIncrementer="0" />
                                <ScaleNote note="B" octaveIncrementer="0" />
                                <ScaleNote note="C" octaveIncrementer="0" />
                                <ScaleNote note="D" octaveIncrementer="0" />
                                <ScaleNote note="E" octaveIncrementer="0" />
                                <ScaleNote note="F" octaveIncrementer="0" />
                                <ScaleNote note="G" octaveIncrementer="0" />
                            </ScaleNotes>
                        </MusicalScale>
                    </Scales>
                </SongChordEntry>
            </SongChord>
            <SongAutomation name="Volume" value="1">
                <SongAutomationValue>1</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Velocity" value="0.8">
                <SongAutomationValue>0.8</SongAutomationValue>
                <SongAutomationValue>0.5</SongAutomationValue>
                <SongAutomationValue>0.75</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Dry" value="0">
                <SongAutomationValue>0</SongAutomationValue>
            </SongAutomation>
            <SongAutomation name="Wet" value="0">
                <SongAutomationValue>0</SongAutomationValue>
                <SongAutomationValue>0.5</SongAutomationValue>
                <SongAutomationValue>0.7</SongAutomationValue>
                <SongAutomationValue>0.8</SongAutomationValue>
            </SongAutomation>
        </SongTrack>
    </SongPart>
</Song>
```

## Example Usage (Analyzation)

Most classes and certain types implements **toJson()** and **toXml()** that will convert them into json and xml strings that can be used to export data etc.

Calling **toString()** will usually yield the result of **toJson()**.

```
auto songXml = song.toXml();
auto trackJson = track.toJson();
auto partJson = part.toString();
auto scaleJson = melody.scale.toJson();
auto melodyXml = melody.toXml();
```

### Get the note of a sequence (SongSequence)

```
auto note = sequence.note;
```

### Get the amount of entries of a sequence (SongSequence)

```
auto amountOfEntries = sequence.entries.length;
```

### Get the length of all entries in a sequence (SongSequence)

```
foreach (entryLength; sequence.entries)
{
  ...
}
```

### Get the octave of a sequence (SongSequence)

```
auto octave = sequence.octave;
```

### Get  the bar of a sequence (SongSequence)

```
auto bar = sequence.bar;
```

### Get the note of a song note (SongNote)

```
auto note = songNote.note;
```

### Get the length of a song note (SongNote)

```
auto length = songNote.length;
```

### Get the step of a song note (SongNote)

```
auto step = songNote.step;
```

### Get the relative step of a song note (SongNote)

A relative step is relative to its parent's step.

Which allows for easy automatic arrangement.

```
auto relativeStep = songNote.relativeStep;
```

### Get the octave of a song note (SongNote)

```
auto octave = songNote.octave;
```

### Get the bar of a song note (SongNote)

```
auto bar = songNote.bar;
```

### Get the parent chord entry of a song note (SongNote)

```
auto parentChordEntry = songNote.parentChordEntry;
```

### Get the notes of a melody (SongMelody)

```
auto notes = melody.notes;

foreach (note; notes)
{
  ...
}
```

### Get the scales of a melody (SongMelody)

When analyzing for scales it will return all most-matching scales of the melody.

This makes it easier to make decisions based on scales because with more data you can make better assumptions.

So root-assumptions will not give the best result and thus a range of possible scales can be retrieved.

```
auto scales = melody.scales;

foreach (scale; scales)
{
  ...
}
```

### Get the progression of a melody (SongMelody)

A progression is the way a melody progresses through its time.

There are the following progressions to retrieve.

(Currently not entirely implemented.)

* None
* Unknown
* Upwards
* Downwards
* Up-Downwards
* Down-Upwards
* Swinging-Upwards
* Swinging-Downwards
* Steady
* SteadySwing
* Up-Swing
* Down-Swing

```
auto progression = melody.progression;
```

### Get the bar of a chord (SongChord)

```
auto bar = chord.bar;
```

### Get the positive harmonics of a chord (SongChord)

Positive harmonics are the amount of harmonics that goes octaves above the chord's base octave.

```
auto positiveHarmonics = chord.positiveHarmonics;
```

### Get the negative harmonics of a chord (SongChord)

Negative harmonics are the amount of harmonics that goes below the chord's base octave.

```
auto negativeHarmonics = chord.negativeHarmonics;
```

### Get the chord entries of a chord (SongChord)

```
auto chordEntries = chord.entries;

foreach (chordEntry; chord.entries)
{
  ...
}
```

### Get the scales of a chord (SongChord)

```
auto totalScales = chord.scales;

foreach (chordEntryScales; totalScales)
{
  foreach (scale; chordEntryScales)
  {
    ...
  }
}
```

### Get the notes of a chord entry (SongChordEntry)

```
auto notes = chordEntry.notes;

foreach (note; notes)
{
  ...
}
```

### Get the lenght of a chord entry (SongChordEntry)

```
auto length = chordEntry.length;
```

### Get the scales of a chord entry (SongChordEntry)

```
auto scales = chordEntry.scales;

foreach (scale; scales)
{
  ...
}
```

### Get the parent chord of a chord entry (SongChordEntry)

```
auto parentChord = chordEntry.parentChord;
```

### Get the chord, melody or sequence of a track. (SongTrack)

A track can only have one of either a chord, melody or sequence to simplify analyzation and manipulation.

```
auto chord = track.chord;
auto melody = track.melody;
auto sequence = track.sequence;

// Only one of them won't be null depending on what data the track holds.
```

### Get the name of the track (SongTrack)

```
auto name = track.name;
```

### Get the bar of the track (SongTrack)

```
auto bar = track.bar;
```

### Get the volume automation of the track (SongTrack)

```
auto volume = track.volume;
```

### Get the velocity automation of the track (SongTrack)

```
auto velocity = track.velocity;
```

### Get the dry automation of the track (SongTrack)

```
auto dry = track.dry;
```

### Get the wet automation of the track (SongTrack)

```
auto wet = track.wet;
```

### Get metadata of the track (SongTrack)

```
string metaString = track.getMetaData("keyOfData");

int metaInt = track.getMetaData!int("keyOfData2");
```


### Get meta-automation of the track (SongTrack)

```
auto metaAutomation = track.getMetaAutomation("keyOfMetaAutomation");
```

### Get the scales of a track (SongTrack)

This will only yield results if the track contains a chord or melody.

A sequence has no scales.

```
auto scales = track.scales;

foreach (scale; scales)
{
  ...
}
```

### Get the progression of a track (SongTrack)

This will only yield a result if the track contains a melody.

Chords or sequences has no melodic progression.

```
auto progression = track.progression;
```

### Get the name of an automation clip (SongAutomation)

```
auto name = automation.name;
```

### Get the values of an automation clip (SongAutomation)

```
auto values = automation.values;
```

### Get the base value of an automation clip (SongAutomation)

```
auto value = automation.value;

// Or

auto value2 = automatiob.values[0];
```

### Get the title of a part (SongPart)

The title of a part is the equivalent to a part of the song such as a verse, chorus, bridge etc.

```
auto title = part.title;
```

### Get the bar of a part (SongPart)

```
auto bar = part.bar;
```

### Get the tracks of a part (SongPart)

```
auto tracks = part.tracks;

foreach (track; tracks)
{
  ...
}
```

### Get the name of a song (Song)

```
auto name = song.name;
```

### Get a part of a song (Song)

```
auto part = song.getPart(SongPartTitle.chorus);
```

### Get all parts of a song (Song)

```
auto parts = song.parts;
```

### Get a musical scale based on its given name

```
auto scale = getScale(MusicalScaleName.eMajor);

// scale is the "E Major" scale.
```

### Find possible scales based on a set of notes

```
auto scales = findScales([MusicalNote.c, MusicalNote.e, MusicalNote.a]);

// scales is a set of all possible scales matching the 3 notes the best.

if (scales)
{
  foreach (scale; scales)
  {
    ...
  }
}
```

### Get the notes of a scale (MusicalScale)

```
auto notes = scale.getNotes();
```

### Get all the natural notes of a scale (MusicalScale)

Natural notes are notes without any properties such as octaves etc.

```
auto naturalNotes = scale.getNaturalNotes();
```

### Get the name of the scale (MusicalScale)

```
auto scaleName = scale.scale;
```

### Get the root note of the scale (MusicalScale)

```
auto note = scale.note;
```

### Get the type of the scale (MusicalScale)

The type is either "Major" or "Minor".

```
auto type = scale.type;
```

### Get the natural note of a scale note (MusicalScaleNote)

```
auto note = scaleNote.note;
```

### Get the octave incrementer of a scale note (MusicalScaleNote)

```
auto octaveIncrementer = scaleNote.octaveIncrementer;
```

### Get the ids of a set of notes

A note id can be used to identify a specific note within a range of octaves.

```
auto noteId = getNoteId(MusicalNote.d, 5);

// noteId is the id of the D note within the fifth octave.
```

### Get the directions of a set of note ids

A set of directions will dictate in which way notes progress whether it's up, down or forward.

```
auto directions = getNoteDirections([noteId1, noteId2]);
```

### Get the progression of a set of directions

The progression of a set of directions will dictate the way a melody progresses.

```
auto progression = getProgression(directions);
```

## Example Usage (Manipulation)

At the moment there is no way to automatically convert music into song objects, but in the future there will be support for such automation.

That means right now you have to manually construct your song objects.

### Creating a new sequence (SongSequence)

```
const bar = 4;
const octave = 5;
const sequenceEntries[2,2,2,2];

auto sequence = new SongSequence(MusicalNote.note, bar, octave, sequenceEntries);
```

## Add an entry to a sequence (SongSequence)

```
sequence.addEntry(4);
```

### Creating a new song note (SongNote)

```
const length = 4;
const step = 0;
const octave = 6;
const bar = 0;

auto note = new SongNote(MusicalNote.gFlat, length, step, octave, bar);

...

auto note = new SongNote(MusicalNote.c, step, octave, chordEntry);
```

### Converting a song note a flat note (SongNote)

```
note.convertToFlat();
```

### Converting a song note to a flat note (SongNote)

```
note.convertFromFlat();
```

### Creating a new melody (SongMelody)

```
auto notes = [note1, note2, note3];

auto melody = new SongMelody(notes);

...

auto melody = new SongMelody;
```

### Append a note to the melody

```
melody.appendNote(note);
```

### Convert all notes to flat

```
melody.convertToFlat();
```

### Convert all notes from flat

```
melody.convertFromFlat();
```

### Creating a new chord (SongChord)

```
auto entries = [chordEntry1, chordEntry2, chordEntry3, chordEntry4];

const bar = 5;

auto chord = new SongChord(entries, bar);

...

const positiveHarmonics = 1;

auto chord = new SongChord(entries, bar, positiveHarmonics);

...

const negativeHarmonics = 1;

auto chord = new SongChord(entries, bar, positiveHarmonics, negativeHarmonics);
```

### Add a chord entry to a chord (SongChord)

```
chord.addChordEntry(chordEntry);
```

### Creating a new chord entry (SongChordEntry)

```
const length = 16;
const bar = 0;

auto chordEntry = new SongChordEntry(length, bar);

...

auto chordEntry = new SongChordEntry(length, bar, chord);

...

auto notes = [note1, note2, note3];

auto chordEntry = new SongChordEntry(length, bar, notes);

...

auto chordEntry = new SongChordEntry(length, bar, notes, chord);
```

### Set the length of a chord entry (SongChordEntry)

The length will always be relative to the maximum size left based on all other chord entry lengths.

Which means the maximum size is 32, but if there are an entry with a length of 16 already then the length will be 16 even if set higher.

This makes sure that it creates accurate music.

```
chordEntry.length = 32;
```

### Set the bar of a chord entry (SongChordEntry)

```
chordEntry.bar = 4;
```

### Add a song note to a chord entry (SongChordEntry)

```
chordEntry.addNote(note);
```

### Convert all notes in the entry to flat (SongChordEntry)

```
chordEntry.convertToFlat();
```

### Convert all notes in the entry from flat (SongChordEntry)

```
chordEntry.convertFromFlat();
```

### Creating a new track (SongTrack)

```
auto track = new SongTrack(chord);

...

auto track = new SongTrack(melody);

...

auto track = new SongTrack(sequence);
```

### Set the chord, melody or sequence of a track (SongTrack)

This will erase all data that the track holds and replace it with the new data!

```
track.chord = chord;

...

track.melody = melody;

...

track.sequence = sequence;
```

### Set the name of a track (SongTrack)

```
track.name = "Strings";

...

track.name = "Kicks"
```

### Set the bar of a track (SongTrack)

```
track.bar = 4;
```

### Set the volume (Or other automation) of a track (SongTrack)

This also works for:

* track.velocity
* track.dry
* track.wet
* Any meta automation added to the track

```
track.volume.value = 0.65;

...

track.volume.addValue(0.75);
track.volume.addValue(0.7);
track.volume.addValue(0.65);

...

const automationPoint = 2;

track.volume.modifyValue(0.65, automationPoint);
```

### Creating a new automation clip (SongAutomation)

```
auto automation = new SongAutomation("My Automation Clip");

...

const initialValue = 0.8;

auto automation = new SongAutomation("My Automation Clip", initialValue);
```

### Set the value/values of an automation clip (SongAutomation)

```
automation.value = 0.65;

...

automation.addValue(0.75);
automation.addValue(0.7);
automation.addValue(0.65);

...

const automationPoint = 2;

automation.modifyValue(0.65, automationPoint);
```

### Creating a new part (SongPart)

```
auto part = new SongPart(SongPartTitle.chorus);
```

### Set the bar of a part (SongPart)

```
part.bar = 8;
```

### Add a track to a part (SongPart)

```
part.addTrack(track);
```

### Creating a new song (Song)

```
auto song = new Song("Super Artist - Super Song");
```

### Add a part to a song (Song)

```
song.addPart(part);
```

### Creating a new musical scale (MusicalScale)

```
auto scale = new MusicalScale(MusicalScaleName.cMajor, MusicalNote.c, MusicalScaleType.major);
```

### Creating a new musical scale note (MusicalScaleNote)

```
auto scaleNote = new MusicalScaleNote(MusicalNote.c);

...

const octaveIncrementer = 1;

auto scaleNote = new MusicalScaleNote(MusicalNote.c, octaveIncrementer);
```

### Convert a note into a flat note

Not all notes have a relative flat note since it only gives flat notes that are part of a proper scale.

This also works with SongNote.

```
auto flatNote = convertToFlatNote(MusicalNote.g);
// flatNote is gFlat

auto sameNote = convertToFlatNote(MusicalNote.f);
// sameNote is f
```

### Convert a flat note into a natural note

This also works with SongNote.

```
auto note = convertFromFlatNote(MusicalNote.dFlat);
// note is cSharp

auto sameNote = convertFromFlatNote(MusicalNote.a);
// sameNote is a
```

### Translate (Convert) a set of notes into flat notes

This also works with SongNote.

```
auto flatNotes = translateToFlatNotes([MusicalNote.cSharp, MusicalNote.e, MusicalNote.gSharp]);
// flatNotes is [dFlat, e, aFlat]
```

### Translate (Convert) a set of notes from flat notes

This also works with SongNote.

```
auto notes = translateFromFlatNotes([MusicalNote.eFlat, MusicalNote.gFlat, MusicalNote.cFlat]);
// notes is [dSharp, fSharp, b];
```

### Translate scale note to natural note

```
auto note = translateToNaturalNote(scaleNote);
```

### Translate a set of scale notes to natural notes

```
auto scaleNotes = [scaleNote1, scaleNote2, scaleNote3];

auto naturalNotes = translateToNaturalNotes(scaleNotes);
```
