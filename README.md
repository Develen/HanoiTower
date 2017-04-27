# Hanoi Tower
Implementation of Hanoi Tower iterative algorithm on swift language for iOS.

The project of Hanoi Tower task for iOS 10.0 and more (swift 3.1). It contains two views: first view allows to user to select amount of disks (from 2 till 7), second view shows animated solution.
It is implemented with iterative algorithm.

## Screenshot
![screen shot 2017-04-27 at 20 51 35](https://cloud.githubusercontent.com/assets/14965467/25499595/a62d1e2e-2b94-11e7-9fd7-f952e7e4c1fb.png)

# Algorithm
 Algorithm https://en.wikipedia.org/wiki/Tower_of_Hanoi: 
For an even number of disks:
* make the legal move between pegs A and C (in either direction),
* make the legal move between pegs A and B (in either direction),
* make the legal move between pegs B and C (in either direction),
* repeat until complete.
For an odd number of disks:
* make the legal move between pegs A and B (in either direction),
* make the legal move between pegs A and C (in either direction),
* make the legal move between pegs B and C (in either direction),
* repeat until complete.

Timer runs algorithm’s iteration every second and animation view draws new state of rods with new amount of disks after replacing.
