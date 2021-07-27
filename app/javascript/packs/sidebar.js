const sidebarItems = document.getElementsByClassName('sidebar-item');

for (let i = 0; i < sidebarItems.length; i++) {
    sidebarItems[i].addEventListener('click', () => {
        sidebarItems[i].classList.add('bg-gray-200');
        sidebarItems[i].classList.add('dark-mode:bg-gray-700');
    });
}