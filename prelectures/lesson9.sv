module test ();
    int a, b, result;

    function void calculate();
        result=a+b;
    endfunction

    function void calculate2(int a, b);
        result=a+b;
    endfunction

    function int calculate3(int a, b);
        return (a+b);
    endfunction

    initial begin
        a=1, b=2, result=a+b;
        a=3, b=4, result=a+b;
        a=5, b=6, result=a+b;
        // which is equivalent to:
        a=1, b=2, calculate();
        a=3, b=4, calculate();
        a=5, b=6, calculate();
        // which is equivalent to:
        calculate2(1, 2);
        calculate2(3, 4);
        calculate2(5, 6);
        // which is equivalent to:
        result = calculate(1, 2);
        result = calculate(3, 4);
        result = calculate(5, 6);
    end
endmodule