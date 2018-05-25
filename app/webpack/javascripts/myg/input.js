import MygInput from 'myg-input';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygInputs = MygInput.initAll( document.querySelectorAll('.myg-input'), {} );
}
