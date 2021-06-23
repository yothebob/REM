(function() {
	function b64toBlob(b64Data, contentType, sliceSize) {
		// from http://stackoverflow.com/a/16245768/5578773
		contentType = contentType || '';
		sliceSize = sliceSize || 512;
	
		var byteCharacters = atob(b64Data);
		var byteArrays = [];
	
		for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
			var slice = byteCharacters.slice(offset, offset + sliceSize);
	
			var byteNumbers = new Array(slice.length);
			for (var i = 0; i < slice.length; i++) {
				byteNumbers[i] = slice.charCodeAt(i);
			}
	
			var byteArray = new Uint8Array(byteNumbers);
	
			byteArrays.push(byteArray);
		}
	
		var blob = new Blob(byteArrays, {type: contentType});
		return blob;
	}
	
	var lastObjectURL = null;
	function reuseObjectURL(blob) {
		if (lastObjectURL) URL.revokeObjectURL(lastObjectURL);
		lastObjectURL = URL.createObjectURL(blob);
		return lastObjectURL;
	}
	
	function saveURL(href, fname) {
		var link = document.createElement("a");
		link.href = href;
		link.download = fname;
		link.setAttribute("download", fname);
		var ctr = canvas.parentElement;
		ctr.appendChild(link);
		link.click();
		ctr.removeChild(link);
	}
	
	function saveB64(data, fname) {
		var href;
		try {
			var pos = data.indexOf(";base64,");
			var blob = b64toBlob(data.substring(pos + 8), data.substring(5, pos));
			if (navigator.msSaveBlob) {
				navigator.msSaveBlob(blob, fname);
				return;
			}
			saveURL(reuseObjectURL(blob), fname);
		} catch (_) {
			saveURL(data, fname);
		}
	}
	
	function saveBlob(blob, fname) {
		if (navigator.msSaveBlob) {
			navigator.msSaveBlob(blob, fname);
			return;
		}
		saveURL(reuseObjectURL(blob), fname);
	}

	///
	window.screen_save_dialog_js = function(fname, id) {
		var canvas = document.getElementById(id);
		var data = canvas.toDataURL();
		saveB64(data, fname);
	}
	
	///
	window.screen_save_part_dialog_js = function(fname, x, y, w, h, id) {
		var canvas = document.getElementById(id);
		var temp = document.createElement("canvas");
		temp.width = w;
		temp.height = h;
		temp.getContext("2d").drawImage(canvas, x, y, w, h, 0, 0, w, h);
		saveB64(temp.toDataURL(), fname);
	}
	
	///
	window.surface_save_dialog_js = function(fname, abuf, width, height) {
		var temp = document.createElement("canvas");
		temp.width = width;
		temp.height = height;
		var ctx = temp.getContext("2d");
		var u8ca = new Uint8ClampedArray(abuf, 0, width * height * 4);
		var imd = new ImageData(u8ca, width, height);
		ctx.putImageData(imd, 0, 0);
		var blob = new Blob([abuf]);
		saveB64(temp.toDataURL(), fname);
	}
	
	///
	window.surface_save_part_dialog_js = function(fname, abuf, awidth, aheight, x, y, width, height) {
		var temp = document.createElement("canvas");
		temp.width = width;
		temp.height = height;
		var ctx = temp.getContext("2d");
		var u8ca = new Uint8ClampedArray(abuf, 0, awidth * aheight * 4);
		var imd = new ImageData(u8ca, awidth, aheight);
		ctx.putImageData(imd, -x, -y);
		var blob = new Blob([abuf]);
		saveB64(temp.toDataURL(), fname);
	}
	
})();