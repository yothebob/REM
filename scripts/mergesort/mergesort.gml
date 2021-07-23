
function mergesort(arr) 
{//mergesort for the parts_dict based of part index
	if array_length(arr) > 1{
		var mid = array_length(arr) div 2;
		var l;
		var r;
		array_copy(l,l[0],arr,arr[0],mid-1);
		array_copy(r,r[0],arr,arr[mid],array_length(arr)-1);
		part_dict_sort(l);
		part_dict_sort(r);
		var i;var j; var k;
		
		while i < array_length(l) and j < array_length(r){
			if l[i] < r[j]{
				arr[k] = l[i];
				i += 1;
			}
			else{
				arr[k] = r[j];
				j += 1;
			}
			k+= 1;
		}
		
		while i < array_length(l){
			arr[k] = l[i];
			i+= 1;
			k+= 1;
		}
		
		while j < array_length(r){
			arr[k] = r[j];
			j += 1;
			k += 1;
		}
	}
}