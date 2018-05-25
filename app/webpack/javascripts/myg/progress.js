import MygProgress from 'myg-progress';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygProgresses = MygProgress.initAll( document.querySelectorAll('.myg-progress'), {} );
}
