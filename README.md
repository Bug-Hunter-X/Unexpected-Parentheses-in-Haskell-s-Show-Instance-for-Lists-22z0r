# Haskell Show Instance Bug

This repository demonstrates a subtle bug in a Haskell program involving the `Show` type class and instances for lists and custom data types. The bug manifests as incorrect parentheses placement in the output when printing lists, particularly those containing custom data types.

The bug is caused by the way precedence is handled within the `showsPrec` function and the interaction of nested lists. The solution involves a more careful consideration of precedence and how to consistently apply parentheses to produce unambiguous output.

## How to Reproduce

1. Clone the repository.
2. Compile the `bug.hs` file using a Haskell compiler (like GHC): `ghc bug.hs`
3. Run the compiled executable: `./bug`

You will observe unexpected parentheses in the output of the list containing `MyData` instances.

## Solution

The solution is provided in `bugSolution.hs`. This demonstrates a corrected implementation of the `Show` instance for lists that addresses the precedence issue. The corrected code ensures that parentheses are used correctly based on precedence, avoiding the output anomalies.