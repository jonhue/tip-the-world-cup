import MygDropdown from 'myg-dropdown';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygDropdowns = MygDropdown.initAll( document.querySelectorAll('.myg-dropdown'), {} );
}
