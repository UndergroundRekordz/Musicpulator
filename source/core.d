module musicpulator.core;

/// A collection that can maximum contain a specific amount of items.
struct MaxSizeCollection(T, size_t initMaxSize = 0)
{
  private:
  /// The collection.
  T[] _collection;
  /// The current index.
  size_t _current;
  /// The max size.
  size_t _maxSize = initMaxSize;

  public:
  static if (!initMaxSize)
  {
    /**
    * Creates a new max size collection.
    * Params:
    *   maxSize = The maximum size of the collection.
    */
    this(size_t maxSize)
    {
      _maxSize = maxSize;
    }
  }

  @property
  {
    /// Gets the maximum size of the collection.
    size_t maxSize() { return _maxSize; }

    /// Gets the length of the collection.
    size_t length() { return _collection ? _collection.length : 0; }
  }

  /**
  * Adds an item to the collection.
  * Params:
  *   item = The item to add.
  */
  void add(T item)
  {
    if (_collection && _collection.length == _maxSize)
    {
      return;
    }

    _collection ~= item;
  }

  /// Clears the collection.
  void clear()
  {
    _collection = null;
  }

  // Range Implementation:
  @property
  {
    T front()
    {
      if (!_collection)
      {
        return T.init;
      }

      return _collection[_current];
    }

    bool empty()
    {
      return !_collection || !_collection.length || _current >= _collection.length;
    }
  }

  void popFront()
  {
    _current++;
  }

  T opIndex(size_t index)
  {
    return _collection[index];
  }

  void opIndexAssign(T item, size_t index)
  {
    if (index >= _maxSize)
    {
      return;
    }

    if (_collection.length < index)
    {
      _collection.length = index;
    }

    _collection[index] = item;
  }

  T[] array()
  {
    return _collection;
  }
}

/// A collection that can only be modified within the package.
struct InternaleCollection(T)
{
  private:
  /// The collection.
  T[] _collection;
  /// The current index.
  size_t _current;

  public:
  @property
  {
    /// Gets the length of the collection.
    size_t length() { return _collection ? _collection.length : 0; }
  }

  package(musicpulator)
  {
    /**
    * Adds an item to the collection.
    * Params:
    *   item = The item to add.
    */
    void add(T item)
    {
      _collection ~= item;
    }

    /// Clears the collection.
    void clear()
    {
      _collection = null;
    }
  }

  // Range Implementation:
  @property
  {
    T front()
    {
      if (!_collection)
      {
        return T.init;
      }

      return _collection[_current];
    }

    bool empty()
    {
      return !_collection || !_collection.length || _current >= _collection.length;
    }
  }

  void popFront()
  {
    _current++;
  }

  T opIndex(size_t index)
  {
    return _collection[index];
  }

  void opIndexAssign(T item, size_t index)
  {
    _collection[index] = item;
  }

  T[] array()
  {
    return _collection;
  }
}

/// A collection that can maximum contain a specific amount of items and can only be modified internally in the package.
struct InternalMaxSizeCollection(T, size_t initMaxSize = 0)
{
  private:
  /// The collection.
  T[] _collection;
  /// The current index.
  size_t _current;
  /// The max size.
  size_t _maxSize = initMaxSize;

  public:
  static if (!initMaxSize)
  {
    /**
    * Creates a new max size collection.
    * Params:
    *   maxSize = The maximum size of the collection.
    */
    this(size_t maxSize)
    {
      _maxSize = maxSize;
    }
  }

  @property
  {
    /// Gets the maximum size of the collection.
    size_t maxSize() { return _maxSize; }

    /// Gets the length of the collection.
    size_t length() { return _collection ? _collection.length : 0; }
  }

  package(musicpulator)
  {
    /**
    * Adds an item to the collection.
    * Params:
    *   item = The item to add.
    */
    void add(T item)
    {
      if (_collection && _collection.length == _maxSize)
      {
        return;
      }

      _collection ~= item;
    }

    /// Clears the collection.
    void clear()
    {
      _collection = null;
    }
  }

  /// Clears the collection.
  void clear()
  {
    _collection = null;
  }

  // Range Implementation:
  @property
  {
    T front()
    {
      if (!_collection)
      {
        return T.init;
      }

      return _collection[_current];
    }

    bool empty()
    {
      return !_collection || !_collection.length || _current >= _collection.length;
    }
  }

  void popFront()
  {
    _current++;
  }

  T opIndex(size_t index)
  {
    return _collection[index];
  }

  void opIndexAssign(T item, size_t index)
  {
    if (index >= _maxSize)
    {
      return;
    }

    if (_collection.length < index)
    {
      _collection.length = index;
    }

    _collection[index] = item;
  }

  T[] array()
  {
    return _collection;
  }
}
