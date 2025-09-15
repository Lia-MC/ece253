module test ();
    initial begin
        $display("Hello world");
    end
    // we can use a string variable
    string sHello = "Hello World";
    initial begin
        $display(sHello);
    end

    logic[3:0] i = 4'd12;
    initial begin
        // formating print statements!!!

        // decimal
        $display("i=%d", i) // prints i= 12 (adds random space after equal sign)
        $display("i=%0d", i) // prints i=12 (removes the space)

        // binary
        $display("i=%0b", i) // prints i=1100

        // hexadecimal
        $display("i=%0h", i) // prints i=c

        // multiple formaters
        $display("i=%0d, %0b, %0h", i, i, i) // prints i=12, i=1100, i=c

        // concatenation 
        string name = "John";
        string name2 = {name, name}; // name2 = "JohnJohn"

        $display("Hello %s", name); // prints Hello John
        $display("Hello %s", name2); // prints Hello JohnJohn
        $display("Hello %s", {name, " ", name}); // prints Hello John John
    end

    string myName = "Leo";
    string yourName = "John";
    
    initial begin
        if (myName == yourName) begin
            $display("%s==%s", myName, yourName); // here this would be false
        end

        // useful operators
        $display("%s", myName.toupper()); // convert to upper case
        $display("%s", myName.tolower()); // convert to lower case
        $display("%s", myName.getc(0)); // get character at index 0
        $display("%s", myName.substr(0, 1)); // get substring from index 0 to 1 inclusive
    end

    string str = "1234";
    int i;
    initial begin
        i = str.len(); // returns length of string
        i = str.atoi(); // converts string with numbers in them into a numerical variable
        // here we convert "1234" to 1234

        // similarly, we can convert number to string
        i = 5678;
        str.itoa(i);
    end

    // FILES!!!

    // file writing
    integer fd;
    string content = "hellooo";
    initial begin
        fd = $fopen("file.txt", "w"); // w indicates write
        if (fd) begin
            $fdisplay(fd, content); // write a line
        end
        $fclose(fd);
    end

    // file reading
    integer fd;
    string content;
    initial begin
        fd = $fopen("file.txt", "r");
        if (fd) begin
            $fgets(content, fd); // read a line
        end
        $fclose(fd);
    end
endmodule