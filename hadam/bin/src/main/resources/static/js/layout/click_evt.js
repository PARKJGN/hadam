/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
    var alarmLink = document.getElementById('alarmLink');

    alarmLink.addEventListener('click', function() {
        var alramUserMenu = document.querySelector('.alram-user-menu');
        alramUserMenu.classList.toggle('hu-menu-vis');
    });
});
  
  
