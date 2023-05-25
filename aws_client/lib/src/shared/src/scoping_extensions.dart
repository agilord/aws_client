extension ScopingFunctions<T extends Object?> on T {
  /// Calls the specified function [block] with `this` value
  /// as its argument and returns its result.
  R let<R>(R Function(T e) block) => block(this);

  /// Calls the specified function [block] with `this` value
  /// as its argument and returns `this` value.
  T also(void Function(T e) block) {
    block(this);
    return this;
  }
}
