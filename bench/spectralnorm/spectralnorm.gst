"* The Computer Language Shootout
    http://shootout.alioth.debian.org/
    contributed by Isaac Gouy
    modified by Eliot Miranda *"!

!Array methodsFor: 'benchmarking'!multiplyAtAv   ^(self multiplyAv) multiplyAtv! !!Array methodsFor: 'benchmarking'!multiplyAtv   | n atv |   n := self size.   atv := Array new: n withAll: 0.0d0.   1 to: n do: [:i|          1 to: n do: [:j|         atv at: i put: (atv at: i) + ((j matrixA: i) * (self at: j)) ]].   ^atv! !!Array methodsFor: 'benchmarking'!multiplyAv   | n av |   n := self size.   av := Array new: n withAll: 0.0d0.   1 to: n do: [:i|          1 to: n do: [:j|         av at: i put: (av at: i) + ((i matrixA: j) * (self at: j)) ]].   ^av! !!SmallInteger methodsFor: 'benchmarking'!matrixA: anInteger"fixup one-based indexing to zero-based indexing - cleanup later"   | i j |   i := self - 1.    j := anInteger - 1.   ^1.0d0 / (i + j * (i + j + 1) /2  + i + 1) asFloatD! !!Tests class methodsFor: 'benchmarking'!spectralnorm: n   | u v vBv vv |   u := Array new: n withAll: 1.0d0.   v := Array new: n withAll: 0.0d0.   10 timesRepeat:      [v := u multiplyAtAv.       u := v multiplyAtAv].   vBv := 0.0d0.   vv := 0.0d0.   1 to: n do:      [:i |       vBv := vBv + ((u at: i) * (v at: i)).       vv := vv + ((v at: i) * (v at: i))].   ^(vBv / vv) sqrt! !!Tests class methodsFor: 'benchmark scripts'!spectralnorm   self stdout nextPutAll: 
      ((self spectralnorm: self arg) asStringWithDecimalPlaces: 9); nl.   ^''! !

Tests spectralnorm!
