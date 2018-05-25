import MygButton from 'myg-button';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygButtons = MygButton.initAll( document.querySelectorAll('.myg-button'), {} );
}
