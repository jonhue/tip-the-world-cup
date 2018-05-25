import MygTooltip from 'myg-tooltip';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygTooltips = MygTooltip.initAll( document.querySelectorAll('[data-myg-tooltip]'), {} );
}
