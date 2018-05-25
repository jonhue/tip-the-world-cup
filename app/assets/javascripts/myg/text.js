import MygText from 'myg-text';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygTexts = MygText.initAll( document.querySelectorAll('.myg-text'), {} );
}
