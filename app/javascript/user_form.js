document.addEventListener('DOMContentLoaded', function() {
    var tabs = document.querySelectorAll('.tabs h3 a');
  
    tabs.forEach(function(tab) {
      tab.addEventListener('click', function(event) {
        event.preventDefault();
  
        tabs.forEach(function(tab) {
          tab.classList.remove('active');
        });
        this.classList.add('active');
  
        var tabContent = document.querySelector(this.getAttribute('href'));
        var allTabContents = document.querySelectorAll('div[id$="tab-content"]');
        allTabContents.forEach(function(content) {
          content.classList.remove('active');
        });
        tabContent.classList.add('active');
      });
    });
  });