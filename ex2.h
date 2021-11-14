// 208642884 Guy Adani

#ifndef UNTITLED2_EX2_H
#define UNTITLED2_EX2_H

typedef int magnitude;

magnitude transfer(magnitude a); // transfer int to magnitude and the opposite

magnitude add(magnitude a, magnitude b); // a + b
magnitude sub(magnitude a, magnitude b); // a - b
magnitude multi(magnitude a, magnitude b); // a * b

// true = 1, false = 0
int equal(magnitude a, magnitude b); // a = b
int greater(magnitude a, magnitude b); // a > b
int is_negative(magnitude a); // a < 0
int is_multi_wrong(magnitude a, magnitude b, magnitude multi); // sign of multi is wrong


#endif //UNTITLED2_EX2_H
