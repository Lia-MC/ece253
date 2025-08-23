module test ();
    byte data[3:0]; 
    byte numdata = 3; 
    initial begin
        for (int i = 0; i < numdata; i++) begin
            dataOut = data[i];
            #10ns;
        end
    end

    // types of arrays
    byte data[3:0]; // fixed size array, synthesizable
    byte dynamicArray[]; // dynamic array // used in test bench, not synthesizable
    byte queue[$]; // queue // used in test bench, not synthesizable
    byte associativeArray[*]; // associative array // used in test bench, not synthesizable

    // dynamic arrays
    int array[]; // no elements made when declared
    initial begin
        array = new[2]; // new[2] creates 2 new elements inside of array
        // now we can modify those 2 elements one by one
        array[0] = 12;
        array[1] = 34;
        array = new[5]; // replaces the 2 old elements with 5 new elements of index 0 to 4
        // to copy over the old elements and add new ones to fill it up:
        array = new[5] (array); // conserves the 12 and 34 from last time, adds 5-2=3 new elements
        array.delete(); // clear all elements
    end

    // queues
    int array[$]; // no elements made when declared
    initial begin
        array.push_back(12); // puts element into queue at index 0
        array.push_back(34); // puts element at index 1
        array.push_back(56); // puts element at index 2
        array.push_front(78); // puts element into index 0, pushes all existing elements back by 1
        array.pop_front(); // removes element at index 0 and pulls all existing elements forward by 1
        array.pop_back(); // removes element at the end of the array
        array.insert(1, 90); // inserts element at index 1, value 90. this pushes back all the elements at index 1 and larger
        array.delete(1); // deletes element at index 1 and pushes all elements at index 2 and greater by 1 to fill the gap
    end

    // associative array, creates elements per index, more similar to map 
    int array[*];
    initial begin
        
    end
endmodule