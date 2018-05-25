import MygMenu from 'myg-menu';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygMenu = MygMenu.init( document.querySelector('.myg-menu'), {} );
}
