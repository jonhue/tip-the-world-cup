import MygActionButton from 'myg-action-button';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygActionButton = MygActionButton.init( document.querySelector('.myg-action-button'), {} );
}
