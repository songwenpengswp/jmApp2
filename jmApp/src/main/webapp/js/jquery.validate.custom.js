/* 追加自定义验证方法 */
// 身份证号码验证   
jQuery.validator.addMethod("idcardno", function(value, element) {
    return this.optional(element) || isIdCardNo(value);
}, "请正确输入身份证号码");

//字母数字
jQuery.validator.addMethod("alnum", function(value, element) {
    return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
}, "只能包括英文字母和数字");

// 手机号码验证   
jQuery.validator.addMethod("mobile", function(value, element) {
    var length = value.length;
    return this.optional(element) || /^1[3|4|5|7|8]\d{9}$/.test(value);
}, "请正确填写手机号码");

// 电话号码验证   
jQuery.validator.addMethod("telephone", function(value, element) {
    var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
    return this.optional(element) || (tel.test(value));
}, "请正确填写电话号码");

// 联系电话验证（手机或者固话）
jQuery.validator.addMethod("phonecode", function(value, element) {
	var tel = /^0\d{2,3}-\d{7,8}(-\d{1,5})?$/g;
	var mob = /^1\d{10}$/g;
    return this.optional(element) || tel.test(value) || mob.test(value);
}, "请正确填写电话号码(手机或固话(xxx-xxxxxxxx))");

// 邮政编码验证
jQuery.validator.addMethod("zipcode", function(value, element) {
    var tel = /^[0-9]{6}$/;
    return this.optional(element) || (tel.test(value));
}, "请正确填写邮政编码");

// 汉字
jQuery.validator.addMethod("chcharacter", function(value, element) {
    var tel = /^[\u4e00-\u9fa5]+$/;
    return this.optional(element) || (tel.test(value));
}, "请输入汉字");

//ip验证  
jQuery.validator.addMethod("ip", function(value, element) {        
    return this.optional(element) || (/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/.test(value) && (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256));        
}, "请输入正确的IP地址"); 

jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {   
   var length = value.length;   
  for(var i = 0; i < value.length; i++){   
   if(value.charCodeAt(i) > 127){   
     length++; 
    }   
   }   
  return this.optional(element) || ( length >= param[0] && length <= param[1] );   
}, "请确保输入值的字节之间(一个中文字算2个字节)");   

// 基于正则的验证
jQuery.validator.addMethod("regex",
function(value, element, param) {
    var exp = new RegExp(param);
    return this.optional(element) || exp.test(value);
},
"格式错误");
/**
* 身份证号码验证
*
*/
function isIdCardNo(num) {

    var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
    var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
    var varArray = new Array();
    var intValue;
    var lngProduct = 0;
    var intCheckDigit;
    var intStrLen = num.length;
    var idNumber = num;
    // initialize
    if ((intStrLen != 15) && (intStrLen != 18)) {
        return false;
    }
    // check and set value
    for (i = 0; i < intStrLen; i++) {
        varArray[i] = idNumber.charAt(i);
        if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
            return false;
        } else if (i < 17) {
            varArray[i] = varArray[i] * factorArr[i];
        }
    }

    if (intStrLen == 18) {
        //check date
        var date8 = idNumber.substring(6, 14);
        if (isDate8(date8) == false) {
            return false;
        }
        // calculate the sum of the products
        for (i = 0; i < 17; i++) {
            lngProduct = lngProduct + varArray[i];
        }
        // calculate the check digit
        intCheckDigit = parityBit[lngProduct % 11];
        // check last digit
        if (varArray[17] != intCheckDigit) {
            return false;
        }
    }
    else {        //length is 15
        //check date
        var date6 = idNumber.substring(6, 12);
        if (isDate6(date6) == false) {

            return false;
        }
    }
    return true;

}
/**
* 判断是否为“YYYYMM”式的时期
*
*/
function isDate6(sDate) {
    if (!/^[0-9]{6}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    if (year < 1700 || year > 2500) return false
    if (month < 1 || month > 12) return false
    return true
}
/**
* 判断是否为“YYYYMMDD”式的时期
*
*/
function isDate8(sDate) {
    if (!/^[0-9]{8}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    day = sDate.substring(6, 8);
    var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if (year < 1700 || year > 2500) return false
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
    if (month < 1 || month > 12) return false
    if (day < 1 || day > iaMonthDays[month - 1]) return false
    return true
} 