
module m();

import "DPI-C" function int myFunction(input int v[]);

int arr[4];
int sum;

initial
begin
#1;
  arr = {1, 2, 3, 4};
  sum = myFunction(arr);
  if( sum == 15)
    $display("PASSED");
  else
    $display("UNIT TEST FAILED, sum=%d", sum);

  $finish();
end

endmodule
