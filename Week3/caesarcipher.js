function caesarCipher (input, shift) {
	if (shift == null){
		return ("The variable '" + input + "' is undefined");
	}


	input = input.split('');
	var output = Array.prototype.map.call(input, function(x){

   		if (/[A-z]/i.test(x)){

    		x = String.fromCharCode(x.charCodeAt(0) + shift);
    	}
    	return x;
    });
    return output.join("");
}

var encrypted = caesarCipher("Et tu, brute?",-3);

console.log(encrypted);

encrypted = caesarCipher("Et tu, brute?", 6);
console.log(encrypted);

encrypted = caesarCipher("Et tu, brute?");
console.log(encrypted);