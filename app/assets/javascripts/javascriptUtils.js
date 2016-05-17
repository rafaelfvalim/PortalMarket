/**
 * Created by root on 16/05/16.
 */

function myConfirm(message) {
    var start = Number(new Date());
    var result = confirm(message);
    var end = Number(new Date());
    return (end<(start+10)||result==true);
}


