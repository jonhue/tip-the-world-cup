import MygToolbar from 'myg-toolbar';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygToolbar = MygToolbar.init( document.querySelector('.myg-toolbar'), {} );
}
