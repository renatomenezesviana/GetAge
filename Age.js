function Age(HyphensYYYYMMDD) {

    const dateInput = HyphensYYYYMMDD;
    const today = new Date();
    const birthDate = new Date(dateInput);
    let age = today.getFullYear() - birthDate.getFullYear();
    const m = today.getMonth() - birthDate.getMonth();
// prevent year < 1000
	const menorano = birthDate.getFullYear();

// data input (birth) without hyphens
    const dateString = dateInput;
    const noHyphensDate = dateString.replace(/-/g, '');
// date today also without hyphens	
    const year = today.getFullYear();
    const month = today.getMonth() + 1; // Months are zero-indexed
    const day = today.getDate();   
    const resultado = (((year * 100) + month) * 100) + day;
// calculate age with subtraction today - birth 	
	const idade = resultado - noHyphensDate;
// convert age to string guaranteeing up to 4 positions for age	
    const idadequatro = idade + 100000000;
	const resultadoString = idadequatro.toString();
// get age with four positions of the subtraction result    
	const firstFourChars = resultadoString.substr(1, 4);

// original calculation does not produce correct result, but maintained when input is invalid
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
// check invalid input
    if (isNaN(age)) {
	age = 0;
	}
// calendar accepted from year 1, so with minimum age 15 years, minimum year = 1000 and maximum today	
	if (menorano < 1000 || menorano > (year - 1)) {
	age = 0;
	}
// if input is not invalid, use age with four subtraction positions
    if (age != 0) {
	age = firstFourChars * 1;
	}

	return age;
}