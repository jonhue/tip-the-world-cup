import MygTitlebar from 'myg-titlebar';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygTitlebar = MygTitlebar.init( document.querySelector('.myg-titlebar'), {} );
}
