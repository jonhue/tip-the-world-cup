import MygModal from 'myg-modal';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygModals = MygModal.initAll( document.querySelectorAll('.modalist'), {} );
}
