#define _USE_MATH_DEFINES
#include <cmath>
extern "C" double f_dcbce0ec78c09daa873732e947d09d75b0fa66cb(const double *params, const double *immed, const double eps) {
double r, s[4];
s[0] = params[4];
s[1] = params[21];
s[0] *= s[1];
s[1] = params[22];
s[2] = params[4];
s[3] = immed[0];
s[2] = s[3] - s[2];
s[1] *= s[2];
s[0] += s[1];
return s[0]; }
