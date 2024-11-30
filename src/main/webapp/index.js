tailwind.config = {
    theme: {
        extend: {
            colors: {
                "primario": "#003857",
                "primario-200": "#176B8D",
                "primario-400": "#1C7FA7",
                "primario-500": "#05517A",
                "primario-600": "#004266",
                "primario-800": "#10466A",
                "secundario": "#f9bf29",
                "secundario-500": "#c99718",
                "primary-100": "#2B9CE6",
                "primary-200": "#0185DC",
                "primary-300": "#0178C7",
                "secondary-300": "#6c7293",
                "secondary-800": "#10466A", //
                "secondary-900": "#003857", //"#003857"
                "contrast-600": "#7E3AF2",
                "contrast-800": "#6816EF",
                "black-50": "#00000045",
                "black-20": "#00000025"
            },
            fontFamily: {
                raleway: "'Raleway', sans-serif"
            },
            boxShadow: {
                "e-top":
                        " 0px 3px 4px -2px rgb(0 0 0 / 0.1), 0px 2px 4px -2px rgb(0 0 0 / 0.1)",
                md: " 0px 0px 4px -2px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)"
            },
            screens: {
                xs: "480px"
            }
        }
    }
};

const clickLogButton = () => {
    const logbutton = document.getElementById('logbutton');
    logbutton.classList.toggle('hidden');
};
const navbutton = document.getElementById('showNav');
const closenav = document.getElementById('closeNav');
const navBar = document.getElementById("navbar");
const overlay = document.querySelector(".overlay");
navbutton?.addEventListener('click', () => {
    navBar?.classList.remove('translate-x-full');
    overlay.classList.remove('hidden');
});
closenav?.addEventListener('click', () => {
    navBar?.classList.add('translate-x-full');
    overlay.classList.add('hidden');
});
overlay?.addEventListener('click', () => {
    navBar?.classList.add('translate-x-full');
    overlay.classList.add('hidden');
});
function toggleLogButton() {
    const logButton = document.getElementById('logbutton');
    logButton.classList.toggle('hidden');
}

