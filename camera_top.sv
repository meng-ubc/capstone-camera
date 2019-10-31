`define Sa 3'b000 // Five  7'b0010010
`define Sb 3'b001 // Two   7'b0100100
`define Sc 3'b010 // Eight 7'b0000000
`define Sd 3'b011 // Four  7'b0011001
`define Se 3'b100 // Nine  7'b0010000

//The five-digit number is 52849
module camera_top(SW,KEY,HEX0);
  input [9:0] SW;
  input [3:0] KEY;
  output [6:0] HEX0;
   
  reg [6:0] HEX0;
  reg [2:0] state;
  
  wire clk,reset,sw;
  
  assign clk = KEY[0];      //assign KEY[0] to clk
  assign reset = ~KEY[1];   //assign the complement of KEY[1] to reset
  assign sw = SW[0];		//assign SW[0] to sw
 
  //evaluate the statement inside the always block whenever clk changes from 0 to 1
  always @(posedge clk) begin
	if(reset)				 //if reset has been pressed, set state to state 1(Sa)
		state = `Sa;
	else begin
	 if(sw)begin			 //if sw has a value of one, cycle forward
	   case(state)
		`Sa : state = `Sb;
		`Sb : state = `Sc;
		`Sc : state = `Sd;
		`Sd : state = `Se;
		`Se : state = `Sa;
        default: state = 3'bxxx;
	   endcase
	end else begin 			//if sw has a value of zero, cycle backward
        case(state)
		 `Sa : state = `Se;
		 `Sb : state = `Sa;
		 `Sc : state = `Sb;
		 `Sd : state = `Sc;
		 `Se : state = `Sd;
        default: state = 3'bxxx;
		endcase
      end
	end
	case(state)             //assign a value to HEX0 according to the current state
		`Sa : HEX0 = 7'b0010010;
		`Sb : HEX0 = 7'b0100100;
		`Sc : HEX0 = 7'b0000000;
		`Sd : HEX0 = 7'b0011001;
		`Se : HEX0 = 7'b0010000;
		default : HEX0 = 7'b1000000;
		endcase
	end
	
	logic [9:0] temp1, temp2;
	logic [7:0] c1, c2, c3;
	logic t1, t2, t3;
	Graphics_Controller gc ( 1,1,8'b0,8'b0,8'b0,10'b0,10'b0, t1,t2,t3,c1,c2,c3,temp1,temp2);
	
endmodule