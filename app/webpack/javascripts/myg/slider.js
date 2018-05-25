import MygSlider from 'myg-slider';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygSliders = MygSlider.initAll( document.querySelectorAll('.myg-slider'), {} );
}
