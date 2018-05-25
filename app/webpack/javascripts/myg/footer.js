import MygFooter from 'myg-footer';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygFooter = MygFooter.init( document.querySelector('.myg-footer'), {} );
}
