import MygFormField from 'myg-form-field';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygFormFields = MygFormField.initAll( document.querySelectorAll('.myg-form-field'), {} );
}
