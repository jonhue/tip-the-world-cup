import MygDialog from 'myg-dialog';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygDialogs = MygDialog.initAll( document.querySelectorAll('.myg-dialog'), {} );
}
