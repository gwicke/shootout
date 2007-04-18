"* The Computer Language Shootout
    http://shootout.alioth.debian.org/
    contributed by Isaac Gouy
    modified by Eliot Miranda *"!

!Float methodsFor: 'benchmarking'!fib   ^self < 2.0 ifTrue: [1.0] ifFalse: [(self - 2.0) fib + (self - 1.0) fib]! !!Float methodsFor: 'benchmarking'!tak: y z: z   ^y < self       ifTrue: [((self - 1.0) tak: y z: z) tak:        ((y - 1.0) tak: z z: self) z: ((z - 1.0) tak: self z: y)]      ifFalse: [z]! !!SmallInteger methodsFor: 'benchmarking'!ack: aSmallInteger   ^self == 0      ifTrue: [aSmallInteger + 1]      ifFalse: [         aSmallInteger == 0            ifTrue: [self - 1 ack:  1]            ifFalse: [self - 1 ack: (self ack: aSmallInteger - 1)] ]! !!SmallInteger methodsFor: 'benchmarking'!fib   ^self < 2 ifTrue: [1] ifFalse: [(self - 2) fib + (self - 1) fib]! !!SmallInteger methodsFor: 'benchmarking'!tak: y z: z   ^y < self       ifTrue: [((self - 1) tak: y z: z) tak:        ((y - 1) tak: z z: self) z: ((z - 1) tak: self z: y)]      ifFalse: [z]! !!Tests class methodsFor: 'benchmarking'!recursive: nArg to: output   | n |   n := nArg.   output       nextPutAll: 'Ack(3,', n printString, '): '; print: (3 ack: n); nl;      nextPutAll: 'Fib(', ((27.0+n) asStringWithDecimalPlaces: 1), '): ',          ((27.0+n) fib asStringWithDecimalPlaces: 1); nl.   n := n - 1.   output       nextPutAll: 'Tak(', (3*n) printString, ',',         (2*n) printString, ',', n printString, '): ',           (3*n tak: 2*n z: n) printString; nl;      nextPutAll: 'Fib(3): '; print: 3 fib; nl;      nextPutAll: 'Tak(3.0,2.0,1.0): ',           ((3.0 tak: 2.0 z: 1.0) asStringWithDecimalPlaces: 1); nl! !!Tests class methodsFor: 'benchmark scripts'!recursive   self recursive: self arg to: self stdout.   ^''! !

Tests recursive!
