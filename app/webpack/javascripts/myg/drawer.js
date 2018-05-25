import MygDrawer from 'myg-drawer';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygDrawer = MygDrawer.init( document.querySelector('.myg-drawer'), {} );
}
