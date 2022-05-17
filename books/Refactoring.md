# Refactoring
## Improving the Design of Existing Code
### Martin Fowler

*Chapter 3*

Bad Smells in Code


* MYSTERIOUS NAME 

* DUPLICATED CODE
- If you have codes that behave the same, please group instructions, and then call them where they are needed.

* LONG FUNCTION
- A function must have a descriptive name and be small-
- If you can't give a function a defined name it means it's doing too many things, please separate instructions.

* LONG PARAMETER LIST
- Parameters must be grouped into data structures

* GLOBAL DATA
-  The problem with global data is that it can be modified from anywhere in the code base, and there’s no mechanism to discover which bit of code touched it.
- Keeping variables encapsulated is the key to coping with changes as software evolves.

* MUTABLE DATA
- Once a data type is defined, it should never change.
 
* DIVERGENT CHANGE
- Create functions that do the same thing and can be adapted to different contexts

* SHOTGUN SURGERY
- Create behavior templates using a wrapper

* FEATURE ENVY


* DATA CLUMPS


* PRIMITIVE OBSESSION


* REPEATED SWITCHES


* LOOPS
- We find that pipeline operations, such as filter and map, help us quickly
see the elements that are included in the processing and what is done with them.


* LAZY ELEMENT
- create functions inline and in case the function grows refactor it and give it a name

* SPECULATIVE GENERALITY
- Eliminate functions that could be useful in the future, if they become required it is best to create it at the time

* TEMPORARY FIELD


* MESSAGE CHAINS

* MIDDLE MAN

* INSIDER TRADING


* LARGE CLASS


* ALTERNATIVE CLASSES WITH DIFFERENT INTERFACES


* DATA CLASS


* REFUSED BEQUEST


* COMMENTS

    - When you feel the need to write a comment, first try to refactor the code so
    that any comment becomes superfluous.
    - A comment can also explain why you did something.