// name: const13.mo
// keywords:
// status: incorrect
// cflags:   +d=scodeInst
//

model A
  package D
    constant Real y;
  end D;

  package B
    extends D;
    constant Real x;
  end B;
end A;

model C
  A a(B(y = 3.0));
  Real y = a.B.y;
end C;

// Result:
// Error processing file: const13.mo
// [flattening/modelica/scodeinst/const13.mo:20:3-20:17:writable] Error: Lookup of element B is not allowed via component a when looking for a.B.y (only function calls may be looked up via a component).
//
// # Error encountered! Exiting...
// # Please check the error message and the flags.
//
// Execution failed!
// endResult
