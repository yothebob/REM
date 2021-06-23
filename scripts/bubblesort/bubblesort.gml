// Script assets have changed

function bubblesort(arr){

        var n = array_length(arr); 
        for (var i = 0; i < n-1; i++) 
            for (var j = 0; j < n-i-1; j++) 
                if (abs(ceil(arr[j]/10)*10)-arr[j]) > (abs(ceil(arr[j+1]/10)*10)-arr[j+1])
                { 
                    // swap arr[j+1] and arr[i] 
                    var temp = arr[j]; 
                    arr[@j] = arr[j+1]; 
                    arr[@j+1] = temp; 
                } 
    
}
