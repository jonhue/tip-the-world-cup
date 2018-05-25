import MygToast from 'myg-toast';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygToast = MygToast.init( document.querySelector('.myg-toast'), {} );
}
