/* navToRecordController.js */
({
    handleClick: function (component, event, helper) {
        var navEvt = '0017F00000ssXNIQA2';
        var nav='https://accionlabs-dev-ed.lightning.force.com/lightning/r/Account/';
        window.location =  nav + navEvt +'/view';
    }
})