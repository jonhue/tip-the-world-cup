import MygTheme from 'myg-theme';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygTheme = MygTheme.init( document.querySelector('html'), {} );
}
