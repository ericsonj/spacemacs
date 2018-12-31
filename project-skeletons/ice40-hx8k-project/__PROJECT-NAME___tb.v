/**
 * File:   __PROJECT-NAME___tb.v
 * Author: __USER-NAME__
 * 
 * Created on __(format-time-string "%B %e, %Y, %l:%M %p")__
 */

module __PROJECT-NAME___tb (/**PORTS**/);

   initial begin

      $dumpfile("__PROJECT-NAME___tb.vcd");    

      $dumpvars(0, __PROJECT-NAME___tb);
      
      # 10 $finish;
        
   end
   
endmodule // __PROJECT-NAME___tb
