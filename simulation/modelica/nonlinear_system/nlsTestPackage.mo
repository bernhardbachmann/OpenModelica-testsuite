//
//  Package that defines a set of  test problems
//  for nonlinear equation system solvers.
//
//  references:
//    http://orion.math.iastate.edu/burkardt/f_src/testnls/testnls.html
//    http://www-m2.ma.tum.de/foswiki/pub/M2/Allgemeines/SemWs09/testprob.pdf
//

package nonlinear_system
  model problem1 "adapted Rosenbrock function"
    parameter Integer N = 10;
    Real x[N];
    Real z;
    Real y;
  equation
    x[1] = 1 - y - z;
    for i in 2:N loop
      0 = 100*(x[i]-x[i-1]^2);
    end for;
    z = sum(x);
    der(y) = z;
  end problem1;

  model problem2 "adapted Rosenbrock function"
    parameter Integer N = 10;
    Real x[N];
    Real y(start=-1);
  equation
    x[N] = 1 - x[1];
    for i in 2:N loop
      y = 10*(x[i]-x[i-1]^2);
    end for;
    der(y) = 1;
  end problem2;

  model problem3 "Powell singular function"
    parameter Integer N = 4;
    Real x[N](each start=1);
  equation
    0 = x[1] + 10.0 * x[2];
    0 = sqrt(5.0) * (x[3] - x[4]);
    0 = (x[2] - 2.0 * x[3])^2;
    0 = sqrt(10.0) * (x[1] - x[4])^2;
  end problem3;

  model problem4 "Powell's badly scaled problem"
    Real x1;
    Real x2;
  equation
    0 = 10000*x1*x2-1;
    0 = exp(-x1) + exp(-x2) - 1.0001;
  end problem4;

  model problem5 "trigonometric-problem"
    parameter Integer N = 10;
    Real x[N](start={0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.2,0.15,0.13});
    Real sum;
  algorithm
    sum := 0;
    for j in 1:N loop
      sum := sum + cos(x[j]);
    end for;
  equation
    for k in 1:N loop
      N = sin(x[k]) - k*(1-cos(x[k])) + sum;
    end for;
  end problem5;

  model problem6 "two-point boundary value problem"
    parameter Integer N = 100;
    parameter Real h = 1/(N+1);
    Real x[N](each start=0.5);
  equation
    x[1] = x[N];
    for k in 2:N-1 loop
      0 = -x[k-1] + 2*x[k] -x[k+1] + (h^2/2)*(x[k]+k*h+1)^2;
    end for;
    x[N] = 0;
  end problem6;

  model problem7 "Brown almost-linear function"
    parameter Integer N = 10;
    Real x[N](each start=1.5);
  equation
   for i in 1:N-1 loop
      0 = x[i] + sum(x) - (N+1);
   end for;
   product(x) = 1;
  end problem7;

  model problem8
  function s
    input Real a;
    output Real y;
  algorithm
    y := if a < -1 then (a-3)/4
       else if a > 1 then (a+3)/4
       else a;
  end s;
    Real x(start=1, fixed=true);
    Real y;
    Real a;
  equation
    der(x)  = y;
    der(y) = -0.1*a - 0.4 *y;
    0 = 10*x-s(a);
  end problem8;

  model problem9
    Real x(start = 0.9,fixed=true);
    Real y(fixed=false), z;
    parameter Real a=2;
  equation
    (z + 0.5*sin(y))*der(x) + der(y) = a*sin(time);
    x-y = exp(-0.9*x)*cos(y);
    when sample(0,0.01) then
      z = der(x)*y;
    end when;
  end problem9;

  model problem10
    parameter Real xn = 1e5;
    parameter Real yn = 1e-3;
    parameter Real f1 = 1.0e-1;
    parameter Real f2 = 1.0e5;
    Real x(start=1.5*xn, nominal=xn);
    Real y(start=1.5*yn, nominal=yn);
  equation
    0 = f1*(-(x/xn)*exp(-(x/xn)*(y/yn))-1);
    0 = f2*((y/yn)*exp(-(x/xn)+(y/yn))-1);
  end problem10;

end nonlinear_system;
