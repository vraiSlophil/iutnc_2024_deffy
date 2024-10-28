document.addEventListener('DOMContentLoaded', function() {
    const errorDiv = document.querySelector('div.error');
    if (errorDiv) {
        errorDiv.classList.add('show');
        setTimeout(() => {
            errorDiv.classList.add('hide');
        }, 3000);
    }
});