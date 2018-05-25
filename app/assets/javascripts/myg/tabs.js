import MygTabs from 'myg-tabs';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    const mygTabs = MygTabs.init( document.querySelector('.myg-tabs'), {} );
}
