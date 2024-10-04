module ssd(in, out);
	
	// Input: 4-bit binary value to be decoded (representing hexadecimal digits 0 to F)
	input  [3:0] in;
	
	// Output: 7-bit signal corresponding to the seven segments (a to g) of a display
	output [6:0] out;
	
	// Boolean functions for each segment (a to g) of the seven-segment display
	assign out[0] = (~in[0])&(~in[1])&(~in[2])&( in[3]) || (~in[0])&( in[1])&(~in[2])&(~in[3]) || 
			( in[0])&(~in[1])&( in[2])&( in[3]) || ( in[0])&( in[1])&(~in[2])&( in[3]);
	assign out[1] = (~in[0])&( in[1])&(~in[2])&( in[3]) || (~in[0])&( in[1])&( in[2])&(~in[3]) || 
			( in[0])&(~in[1])&( in[2])&( in[3]) || ( in[0])&( in[1])&(~in[2])&(~in[3]) || 
			( in[0])&( in[1])&( in[2])&(~in[3]) || ( in[0])&( in[1])&( in[2])&( in[3]);
	assign out[2] = (~in[0])&(~in[1])&( in[2])&(~in[3]) || ( in[0])&( in[1])&(~in[2])&(~in[3]) || 
			( in[0])&( in[1])&( in[2])&(~in[3]) || ( in[0])&( in[1])&( in[2])&( in[3]);
	assign out[3] = (~in[0])&(~in[1])&(~in[2])&( in[3]) || (~in[0])&( in[1])&(~in[2])&(~in[3]) || 
			(~in[0])&( in[1])&( in[2])&( in[3]) || ( in[0])&(~in[1])&( in[2])&(~in[3]) || 
			( in[0])&( in[1])&( in[2])&( in[3]);
	assign out[4] = (~in[0])&(~in[1])&(~in[2])&( in[3]) || (~in[0])&(~in[1])&( in[2])&( in[3]) || 
			(~in[0])&( in[1])&(~in[2])&(~in[3]) || (~in[0])&( in[1])&(~in[2])&( in[3]) || 
			(~in[0])&( in[1])&( in[2])&( in[3]) || ( in[0])&(~in[1])&(~in[2])&( in[3]);
	assign out[5] = (~in[0])&(~in[1])&(~in[2])&( in[3]) || (~in[0])&(~in[1])&( in[2])&(~in[3]) || 
			(~in[0])&(~in[1])&( in[2])&( in[3]) || (~in[0])&( in[1])&( in[2])&( in[3]) || 
			( in[0])&( in[1])&(~in[2])&( in[3]);
	
	/*
 		assign out[6] = (~in[0])&(~in[1])&(~in[2])&(~in[3]) || (~in[0])&(~in[1])&(~in[2])&( in[3]) || 
				(~in[0])&( in[1])&( in[2])&( in[3]) || ( in[0])&( in[1])&(~in[2])&(~in[3]);

		Let's reduce the function of LED out[6]

		For LED out[6], in minterm form, the function is originally:
				f = ~in[0]~in[1]~in[2]~in[3] + ~in[0]~in[1]~in[2] in[3] + 
				    ~in[0] in[1] in[2] in[3] +  in[0] in[1]~in[2]~in[3]
			Reduction process:
				f = ~in[0]~in[1]~in[2]~in[3] + ~in[0]~in[1]~in[2] in[3] + 
				    ~in[0] in[1] in[2] in[3] +  in[0] in[1]~in[2]~in[3]
				  = ~in[0]~in[1]~in[2](~in[3]+in[3]) + ~in[0]in[1]in[2]in[3] + in[0]in[1]~in[2]~in[3]
				  = ~in[0]~in[1]~in[2](1)            + ~in[0]in[1]in[2]in[3] + in[0]in[1]~in[2]~in[3]					
				  = ~in[0]~in[1]~in[2] + ~in[0]in[1]in[2]in[3] + in[0]in[1]~in[2]~in[3]					      
	*/
	
	// Simplified form after minimization of Boolean function
	assign out[6] = (~in[0])&(~in[1])&(~in[2]) || (~in[0])&( in[1])&( in[2])&( in[3]) || 
			( in[0])&( in[1])&(~in[2])&(~in[3]);
	
endmodule
