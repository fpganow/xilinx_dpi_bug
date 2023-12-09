
module m();

import "DPI-C" function int myFunction(input int a, input int b);

int sum;

initial
begin
#1;
  sum = myFunction(1, 2);
  if( sum == 3)
    $display("PASSED");
  else
    $display("UNIT TEST FAILED, sum=%d", sum);

  $finish();
end

endmodule
