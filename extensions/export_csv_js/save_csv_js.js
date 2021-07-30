function exportToCsv(filename,rows){

	let csvContent = "data:text/csv;charset=utf-8,";

	rows.forEach(function(rowArray) {
    		let row = rowArray.join(",");
    		csvContent += row + "\r\n";
	});

	var encodedUri = encodeURI(csvContent);
	var link = document.createElement("a");
	link.setAttribute("href", encodedUri);
	link.setAttribute("download", filename);
	document.body.appendChild(link); // Required for FF

	link.click(); // This will download the data file named "my_data.csv".

}