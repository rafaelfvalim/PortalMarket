//! moment.js locale configuration
//! locale : slovenian (sl)
//! author : Robert Sedovšek : https://github.com/sedovsek
!function(e,n){"object"==typeof exports&&"undefined"!=typeof module?n(require("../moment")):"function"==typeof define&&define.amd?define(["moment"],n):n(e.moment)}(this,function(e){"use strict";function n(e,n,t,a){var r=e+" ";switch(t){case"s":return n||a?"nekaj sekund":"nekaj sekundami";case"m":return n?"ena minuta":"eno minuto";case"mm":return r+=1===e?n?"minuta":"minuto":2===e?n||a?"minuti":"minutama":5>e?n||a?"minute":"minutami":n||a?"minut":"minutami";case"h":return n?"ena ura":"eno uro";case"hh":return r+=1===e?n?"ura":"uro":2===e?n||a?"uri":"urama":5>e?n||a?"ure":"urami":n||a?"ur":"urami";case"d":return n||a?"en dan":"enim dnem";case"dd":return r+=1===e?n||a?"dan":"dnem":2===e?n||a?"dni":"dnevoma":n||a?"dni":"dnevi";case"M":return n||a?"en mesec":"enim mesecem";case"MM":return r+=1===e?n||a?"mesec":"mesecem":2===e?n||a?"meseca":"mesecema":5>e?n||a?"mesece":"meseci":n||a?"mesecev":"meseci";case"y":return n||a?"eno leto":"enim letom";case"yy":return r+=1===e?n||a?"leto":"letom":2===e?n||a?"leti":"letoma":5>e?n||a?"leta":"leti":n||a?"let":"leti"}}var t=e.defineLocale("sl",{months:"januar_februar_marec_april_maj_junij_julij_avgust_september_oktober_november_december".split("_"),monthsShort:"jan._feb._mar._apr._maj._jun._jul._avg._sep._okt._nov._dec.".split("_"),weekdays:"nedelja_ponedeljek_torek_sreda_\u010detrtek_petek_sobota".split("_"),weekdaysShort:"ned._pon._tor._sre._\u010det._pet._sob.".split("_"),weekdaysMin:"ne_po_to_sr_\u010de_pe_so".split("_"),longDateFormat:{LT:"H:mm",LTS:"H:mm:ss",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY H:mm",LLLL:"dddd, D. MMMM YYYY H:mm"},calendar:{sameDay:"[danes ob] LT",nextDay:"[jutri ob] LT",nextWeek:function(){switch(this.day()){case 0:return"[v] [nedeljo] [ob] LT";case 3:return"[v] [sredo] [ob] LT";case 6:return"[v] [soboto] [ob] LT";case 1:case 2:case 4:case 5:return"[v] dddd [ob] LT"}},lastDay:"[v\u010deraj ob] LT",lastWeek:function(){switch(this.day()){case 0:return"[prej\u0161njo] [nedeljo] [ob] LT";case 3:return"[prej\u0161njo] [sredo] [ob] LT";case 6:return"[prej\u0161njo] [soboto] [ob] LT";case 1:case 2:case 4:case 5:return"[prej\u0161nji] dddd [ob] LT"}},sameElse:"L"},relativeTime:{future:"\u010dez %s",past:"pred %s",s:n,m:n,mm:n,h:n,hh:n,d:n,dd:n,M:n,MM:n,y:n,yy:n},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}});return t});