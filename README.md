# hs-simple-check
The idea behind this project is to provide an extremely simple testing framework. E X T R E M E LY.
Examples speak louder than those words so...

```
subject1     = Subject "Reverse function" myFunction
exData1      = "miguel"
expectation1 = "leugim"

check (myFunction exData1 expectation1)

outputs => Reverse function: For input 'miguel', should output leugim -> TRUE
```

Using this example, we have a nice view of what we want: a fast testing tool.

From this example we can derive some important data.

```
type Input a = a
type Expectation a = a
data Test a b = Test String (a -> b) a b | Tests String (a -> b)
```

This means that we can define a test subject (A function with a appended string description) or,
a complete Test, with input and expectation.

This structure let the developer build some interesting constructs. Consider the reverse
function.

```
import Check

subject1 = Test "Reverse function" reverse
exData1      = "miguel"
expectation1 = "leugim"

exData2      = [1,2,3,4,5,6,7,8,9,0]
expectation2 = [0,9,8,7,6,5,4,3,2,1]

tests :: IO()
tests = do
    checkP (subject1 exData1 expectation1)
    checkP (subject1 exData2 expectation2)
```

To make it even easier, we can created a funcion checkP that compose our check
and the print functions, making it easier to use at IO blocks.



# TODO
- [ ] - Change ```check`` check function output String.

       For a test where the input or output is a Boolean, the string is somewhat confusing:
         - Ex:  Solution |> For the input [10,2,5,1,8,20] should output True -> True

       Suggestions for making the message better are a) using another word for the output, or b)
       changing the phrase for something more interesting.

         a) Solution |> For the input [10,2,5,1,8,20] should output True -> OK
         b Solution |> For the input [10,2,5,1,8,20] should output True; holds True

       Math has interesing syntax for proofs that could be a good inspiration.


# Notes
- [27/03/2017]
  - Is ```check``` an interesting name? Should i use ```eval```?
  - The library works clean only for functions that receive its data as it's last input. Other than that, the developer should use a wrapping function.