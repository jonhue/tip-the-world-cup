import MygRadio from 'myg-radio';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygRadios = MygRadio.initAll( document.querySelectorAll('.myg-radio'), {} );
}
