function Age(HyphensYYYYMMDD) {
//  OPERATION TO RECEIVE YYYY-MM-DD FORMAT
//  VARIABLE APPxxx COMPATIBLE Dart Conversion https://www.codeconvert.ai/javascript-to-dart-converter
//  APPIdade or age = -1 FORMAT invalid
//  APPIdade or age = 0  YYYY < 1000 or > TODAY YYYY - 1

    var today = new Date();
    var APPIdade = -1;
    var dateInput = HyphensYYYYMMDD;
//  VALIDATE dateInput FORMAT
    var HYFEN = "-";
    if ((dateInput.substr(4, 1) != HYFEN) 
	 || (dateInput.substr(7, 1) != HYFEN)    
	 || (dateInput.length != 10)) {
		return -1;
	 }
	 
		
//  new Date Format JavaScript
    var dateInputHypen = dateInput;
    var dateInputComma = dateInputHypen.replace(/-/g, ',');

    var birthDate = new Date(dateInputComma);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
	
// original calculation does not produce correct result, but maintained when input is invalid
//    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
//        age--;
//    }
// check invalid input
    if ((isNaN(age)) || (isNaN(m))) {
	return -1;
	}	

//  check calendar

  var string = HyphensYYYYMMDD;
  var APPXmesnas = string.substring(5, 7);
  var APPXdianas = string.substring(8);
  var APPXanonas = string.substring(0, 4);

  var mmBirt = Number (APPXmesnas);
  var ddBirt = Number (APPXdianas);
  var aaBirt = Number (APPXanonas);

  if ((isNaN(mmBirt)) || (isNaN(ddBirt)) || (isNaN(aaBirt))) {
  return -1;	  
  }	  

  var biBirt = aaBirt % 4;
  var APPbianonas = biBirt;

  var APPmesnas = birthDate.month;
  var APPdianas = birthDate.day;
  var APPanonas = birthDate.year;

  var erros = 0;

  if (mmBirt < 1 || ddBirt < 1 || mmBirt > 12 || ddBirt > 31) {
    erros = erros + 1;
  }

  if (mmBirt == 2 && biBirt < 1 && ddBirt > 28) {
    erros = erros + 1;
  }

  if (mmBirt == 2 && biBirt > 0 && ddBirt > 27) {
    erros = erros + 1;
  }

  if ((mmBirt == 4 ||
       mmBirt == 6 ||
       mmBirt == 9 ||
       mmBirt == 11) && ddBirt > 30) {
    erros = erros + 1;
  }

  if (erros > 0) {
    APPIdade = -1;
    return APPIdade;
  }

	
// prevent year < 1000
	var menorano = birthDate.getFullYear();

// data input (birth) without hyphens
    var dateString = dateInput;
    var noHyphensDate = dateString.replace(/-/g, '');
// date today also without hyphens	
 
    var year = today.getFullYear();
    var month = today.getMonth() + 1; // Months are zero-indexed
    var day = today.getDate();   
    var resultado = (((year * 100) + month) * 100) + day;
// calculate age with subtraction today - birth 	
	var idade = resultado - noHyphensDate;
// convert age to string guaranteeing up to 4 positions for age	
    var idadequatro = idade + 100000000;
	var resultadoString = idadequatro.toString();
// get age with four positions of the subtraction result    
	var firstFourChars = resultadoString.substr(1, 4);
	

// calendar accepted from year 1, so with minimum age 15 years, minimum year = 1000 and maximum today	
	if (menorano < 1000 || menorano > (year - 1)) {
	age = 0;
	APPIdade = age;
	}
	
	
// if input is not invalid, use age with four subtraction positions
    if (age != 0) {
	age = Number (firstFourChars);
	APPIdade = age;
	}

	return age;
}
