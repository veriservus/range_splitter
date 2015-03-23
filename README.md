## Range Splitter

Splits a range into multiple ranges.

## Usage

Splits are made as evenly as possible. The larger ranges are placed at the beginning of the array unless the endianness is changed.

```ruby
require 'range_splitter'

(1..10).split
#=> [1..5, 6..10]

(1..9).split
#=> [1..5, 6..9]

(1..9).split(:endianness => :little)
#=> [1..4, 5..9]

(1..10).split(:into => 3)
#=> [1..4, 5..7, 8..10]

(1..9).split(:into => 3)
#=> [1..3, 4..6, 7..9]

(-5..5).split(:into => 5)
#=> [-5..-3, -2..-1, 0..1, 2..3, 4..5]

(5..8).split(:into => 3, :endianness => :little)
#=> [5..5, 6..6, 7..8]

(1..3).split(:into => 100)
#=> [1..1, 2..2, 3..3]

(1..1).split
#=> [1..1]

(1..3).split(:into => 1)
#=> [1..3]

(1..3).split(:into => 0)
# ArgumentError: Cannot split 1..3 into 0 ranges.

(1..3).split(:into => -3)
# ArgumentError: Cannot split 1..3 into -3 ranges.
```

## Contribution

Feel free to contribute. No commit is too small.

You should follow me: [@cpatuzzo](https://twitter.com/cpatuzzo)

## Suggested changes

* [Use keyword arguments](https://github.com/veriservus/range_splitter/blob/419ce7ea796b6c762d1bbc123a2388a29a319339/lib/range_splitter.rb#L2-4)
  https://github.com/veriservus/range_splitter/commit/2a9621dcfe9cbec761658a5f722333970565e453

* [Remove recursive call](https://github.com/veriservus/range_splitter/blob/419ce7ea796b6c762d1bbc123a2388a29a319339/lib/range_splitter.rb#L28)
  https://github.com/veriservus/range_splitter/commit/2a9621dcfe9cbec761658a5f722333970565e453

* [Typecheck for range of something else than integers](https://github.com/veriservus/range_splitter/blob/419ce7ea796b6c762d1bbc123a2388a29a319339/lib/range_splitter.rb#L6-14)
* Consume block and yield resulting ranges (after modifying code to be a loop based rather than recursion based)
  https://github.com/veriservus/range_splitter/commit/f13ad05d8b4a140aff9b353081d34d564f0ecf71

* Change endianness paramter to something more meaningful in this context
