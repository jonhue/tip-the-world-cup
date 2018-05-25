import MygSidebar from 'myg-sidebar';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygSidebar = MygSidebar.init( document.querySelector('.myg-sidebar'), {} );
}
