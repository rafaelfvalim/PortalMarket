/*
 Callback function that is called immediately after JivoChat is loaded
 */
var jivo_onClose, jivo_onLoadCallback, jivo_onOpen;

jivo_onLoadCallback = function () {
    //window.jivo_cstm_widget = document.createElement('div');
    //jivo_cstm_widget.setAttribute('id', 'jivo_custom_widget');
    //document.body.appendChild(jivo_cstm_widget);
    //jivo_cstm_widget.onclick = function () {
    //    jivo_api.open();
    //};
    //
    //window.jivo_cstm_widget.style.display = 'block';

    jivo_api.setContactInfo({
        name: gon.user_name,
        email: gon.email,
        phone: gon.user_phone,
        description: gon.description
    });

    jivo_api.setCustomData([
        {
            content: gon.custom_data
        }
    ]);
};


/*
 Callback function jivo_onOpen and jivo_onClose called whenever the chat window JivoChat is expanded or collapsed by the user or by the proactive invitations rule.
 */

//jivo_onOpen = function () {
//    if (jivo_cstm_widget) {
//        jivo_cstm_widget.style.display = 'none';
//    }
//};
//
//jivo_onClose = function () {
//    if (jivo_cstm_widget) {
//        jivo_cstm_widget.style.display = 'block';
//    }
//};

// ---
// generated by coffee-script 1.9.2