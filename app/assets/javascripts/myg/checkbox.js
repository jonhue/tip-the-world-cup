import MygCheckbox from 'myg-checkbox';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygCheckboxes = MygCheckbox.initAll( document.querySelectorAll('.myg-checkbox'), {} );
}
