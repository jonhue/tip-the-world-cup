import MygToast from 'myg-toast';

['turbolinks:load', 'modalist:render', 'myg-tabs:render'].forEach( (event) => {
    document.removeEventListener( event, init );
    document.addEventListener( event, init );
})
function init() {
    window.mygToast = MygToast.init( document.querySelector('.myg-toast'), {} );
    let notice = document.querySelector('p#notice').innerHTML,
        alert = document.querySelector('p#alert').innerHTML;
    setTimeout(() => {
        if (notice)
            mygToast.show({ message: notice });
        if (alert)
            mygToast.error({ message: alert });
    }, 1000);
}
