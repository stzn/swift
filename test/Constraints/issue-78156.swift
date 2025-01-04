// RUN: %target-typecheck-verify-swift

// https://github.com/swiftlang/swift/issues/78156
func test_mismatched_element_number() {
  func f<each T>(_ value: repeat [each T]) -> (repeat [each T], Bool) {}
  // expected-note@-1 2 {{in inferring pack element #0 of 'value'}}
  let _ = f(f(f([4])))
  // expected-error@-1 {{cannot convert value of type '' to expected argument type '_'}}
  // expected-error@-2 2 {{could not infer pack element #0 from context}}
  // expected-error@-3 {{argument passed to call that takes no arguments}}
  // expected-error@-4 {{'(repeat [], Bool)' is not convertible to '(_: Array<_>)', tuples have a different number of elements}}
}
