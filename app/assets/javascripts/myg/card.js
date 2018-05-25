import MygCard from 'myg-card';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygCards = MygCard.initAll( document.querySelectorAll('.myg-card'), {} );
}
