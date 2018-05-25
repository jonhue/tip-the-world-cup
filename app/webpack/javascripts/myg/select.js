import MygSelect from 'myg-select';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygSelects = MygSelect.initAll( document.querySelectorAll('.myg-select'), {} );
}
