// 208642884 Guy Adani

#include "ex2.h"

typedef int magnitude;

// returns 1 if the sign is wrong in multi.
int is_multi_wrong(magnitude a, magnitude b, magnitude multi) {
    if (is_negative(multi)) {
        if (!is_negative(a) && !is_negative(b)) { return 1; } // (+)*(+)=(-)
        if (is_negative(a) && is_negative(b)) { return 1; }   // (-)*(-)=(-)
    } else {
        if (!is_negative(a) && is_negative(b)) { return 1; }  // (+)*(-)=(+)
        if (is_negative(a) && !is_negative(b)) { return 1; }  // (-)*(+)=(+)
    }
    return 0;
}

// returns 1 if given number is negative
int is_negative(magnitude a) { return (a < 0); }

// transfers from magnitude to int and the opposite
magnitude transfer(magnitude a) {
    int a_abs = a & ~(1 << (8 * sizeof(magnitude) - 1)); // the unsigned magnitude value

    return is_negative(a) ? -a_abs : a_abs;
}

// returns a + b
magnitude add(magnitude a, magnitude b) {
    magnitude ma = transfer(a);
    magnitude mb = transfer(b);
    magnitude sum = ma + mb;

    // adding 2 of the same sign (-/+) is the opposite sign? overflow!
    if (!is_negative(a) && !is_negative(b) && is_negative(sum)) { 
        return (-1) * transfer(sum);
    } else if (is_negative(a) && is_negative(b) && !is_negative(sum)) { 
        return (-1) * transfer(sum);
    }

    return transfer(sum);
} 

// returns a - b, using add function!
magnitude sub(magnitude a, magnitude b) {
    // if b is negative, 2 transfers are needed for the add
    // function. -b as int is not the same as -b in magnitude!
    return add(a, transfer((-1) * transfer(b))); 
} 

// returns a * b
magnitude multi(magnitude a, magnitude b) {
    magnitude ma = transfer(a);
    magnitude mb = transfer(b);
    magnitude multi = ma * mb;

    return is_multi_wrong(a, b, multi) ? (-1) * transfer(ma * mb) : transfer(ma * mb);
} 
    
// returns 1 if a = b, 0 otherwise
int equal(magnitude a, magnitude b){
    magnitude ma = transfer(a);
    magnitude mb = transfer(b);
    return (ma == mb);
}

// returns 1 if a > b, 0 otherwise
int greater(magnitude a, magnitude b){
    magnitude ma = transfer(a);
    magnitude mb = transfer(b);
    return (ma > mb);
}