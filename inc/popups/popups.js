var isMessageDialogShown = false;
var isConfirmDialogShown = false;
var messageDialogHideCallback;
var confirmDialogCallback;
var tmrLoadingScreen;


/**
 * SHOW MESSAGE DIALOG
 * Show the message dialog that displays information to the user
 * @param  {string} title [the header title of the message dialog]
 * @param  {string} message [the body message of the message dialog]
 * @param  {function} callback [the function to execute when the message dialog is hidden]
 */
function showMessageDialog(title, message, callback) {
    var messageDialog = body.find('#message-dialog');
    messageDialog.find('.dialog-title').html(title);
    messageDialog.find('.dialog-message').html(message);
    messageDialog.modal('show');
    messageDialogHideCallback = function() { };
    if (callback != null)
        messageDialogHideCallback = callback;
}


/**
 * HIDE MESSAGE DIALOG
 * Hide the message dialog that displayed information to the user
 * @param  {function} callback [the function to execute when the message dialog is hidden]
 */
function hideMessageDialog(callback) {
    var messageDialog = body.find('#message-dialog');
    messageDialog.modal('hide');
    if (callback != null)
        messageDialogHideCallback = callback;
}


/**
 * SHOW CONFIRM DIALOG
 * Show the confirm dialog that displays a YES or NO question to the user
 * @param  {string} title [the header title of the confirm dialog]
 * @param  {string} message [the body message of the confirm dialog]
 * @param  {function} callback [the function to execute when the confirm dialog is hidden]
 */
function showConfirmDialog(title, message, callback) {
    var confirmDialog = body.find('#confirm-dialog');
    confirmDialog.find('.dialog-title').html(title);
    confirmDialog.find('.dialog-message').html(message);

    var btnConfirmYes = confirmDialog.find('#btnConfirmYes');
    btnConfirmYes.prop('disabled', false);
    btnConfirmYes.prop('disabled', false);
    var fa = btnConfirmYes.find('.fas');
    if (fa.hasClass('fa-circle-notch')) {
        fa.removeClass('fa-circle-notch');
        fa.removeClass('fa-spin');
        fa.addClass('fa-thumbs-up');
    }

    var btnConfirmNo = confirmDialog.find('#btnConfirmNo');
    btnConfirmNo.prop('disabled', false);
    btnConfirmNo.prop('disabled', false);

    confirmDialog.modal('show');
    confirmDialogCallback = function() { };
    if (callback != null)
        confirmDialogCallback = callback;
}


/**
 * CONFIRM YES
 * Perform an action when the YES button of the confirm dialog is clicked
 * @param  {function} action [the function to execute]
 * @param  {function} callback [the function to execute when the confirm dialog is hidden]
 */
function confirmYes(action, callback) {
    var btnConfirmYes = body.find('#btnConfirmYes');
    btnConfirmYes.off();
    btnConfirmYes.on('click', function() {
        btnConfirmYes.prop('disabled', true);
        btnConfirmYes.attr('disabled', true);
        var fa = btnConfirmYes.find('.fas');
        if(fa.hasClass('fa-thumbs-up')) {
            fa.removeClass('fa-thumbs-up');
            fa.addClass('fa-circle-notch');
            fa.addClass('fa-spin');
        }
        var btnConfirmNo = body.find('#btnConfirmNo');
        btnConfirmNo.prop('disabled', true);
        btnConfirmNo.attr('disabled', true);
        action();
    });

    confirmDialogCallback = function() { };
    if (callback != null)
        confirmDialogCallback = callback;
}

/**
 * CONFIRM NO
 * Perform an action when the NO button of the confirm dialog is clicked
 * @param  {function} action [the function to execute]
 * @param  {function} callback [the function to execute when the confirm dialog is hidden]
 */
function confirmNo(action, callback) {
    var btnConfirmNo = body.find('#btnConfirmNo');
    btnConfirmNo.off();
    btnConfirmNo.on('click', function() {
        hideConfirmDialog();
        action();
        btnConfirmNo.off();
        btnConfirmNo.on('click', function(){
            hideConfirmDialog();
        });
    });

    confirmDialogCallback = function() { };
    if (callback != null)
        confirmDialogCallback = callback;
}


/**
 * HIDE CONFIRM DIALOG
 * Hide the confirm dialog that displayed a YES or NO question to the user
 * @param  {function} callback [the function to execute when the confirm dialog is hidden]
 */
function hideConfirmDialog(callback) {
    var confirmDialog = body.find('#confirm-dialog');
    confirmDialog.modal('hide');
    if (callback != null)
        confirmDialogCallback = callback;
}


$(function() {
    var messageDialog = body.find('#message-dialog');
    var confirmDialog = body.find('#confirm-dialog');

    messageDialog.on('shown.bs.modal', function() {
        isMessageDialogShown = true;
    });
    messageDialog.on('hidden.bs.modal', function() {
        messageDialogHideCallback();
        isMessageDialogShown = false;
    });

    confirmDialog.on('shown.bs.modal', function() {
        isConfirmDialogShown = true;
    });
    confirmDialog.on('hidden.bs.modal', function() {
        confirmDialogCallback();
        isConfirmDialogShown = false;
    });

    body.on('keyup', function(e) {
        if(e.keyCode == 13) {
            // ENTER
            if(isMessageDialogShown) {
                if(isMessageDialogShown) {
                    body.find('#message-dialog').modal('hide');
                }
            }
        }
        else if(e.keyCode == 27) {
            // ESC
            if(isConfirmDialogShown)
                hideConfirmDialog();
            else
                hideQuickview();
        }
    });
});