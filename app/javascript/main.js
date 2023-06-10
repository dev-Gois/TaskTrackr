
const menu = document.querySelector('.menu');
const NavMenu = document.querySelector('.nav-menu');
const image = document.querySelector('.rocket');

menu.addEventListener('click', () => {
    menu.classList.toggle('on');
    NavMenu.classList.toggle('on');

});

VanillaTilt.init(document.querySelectorAll(".home-img"), {
    max: 25,
    speed: 400,
    scale: 1.1
});

let typed = new Typed(".text-first", {
    strings: ["Organize", "Improve", "Optimize", "Upgrade"],
    typeSpeed:  100,
    backSpeed: 50,
    loop: true
})