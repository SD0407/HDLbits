module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire [15:0] t1,t2;
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],cout);
    add16 a2(a[31:16],b[31:16],1'b0,t1[15:0],1'b0);
    add16 a3(a[31:16],b[31:16],1'b1,t2[15:0],1'b0);
    
    always @(*)begin
        case(cout)
            1'b0: sum[31:16]=t1;
            1'b1: sum[31:16]=t2;
            default : sum[31:16]=t1;
        endcase
    end

endmodule
