

/*show dashboard menu */
const navMenu = document.getElementById('nav-menu'),
	  navToggle = document.getElementById('nav-toggle'),
	  navClose = document.getElementById('nav-close');
	  
	  
navToggle.addEventListener('click',()=>{
	navMenu.classList.add('show-menu');
})

navClose.addEventListener('click',()=>{
	navMenu.classList.remove('show-menu');
})


/* show profile menu */
document.addEventListener('DOMContentLoaded', () => {
    const navprofile = document.getElementById('nav-profile');
    const profile = document.getElementById('profile');

    profile.addEventListener('click', (event) => {
        // Prevent the click event from propagating to the window
        event.stopPropagation();
        navprofile.classList.toggle('show-profile');
    });

    window.addEventListener('click', () => {
        navprofile.classList.remove('show-profile');
    });
});