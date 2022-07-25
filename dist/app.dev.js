"use strict";

var sections = document.querySelectorAll('.section');
var sectBtns = document.querySelectorAll('.controls');
var sectBtn = document.querySelectorAll('.control');
var allSections = document.querySelector('.main-content');

function PageTransitions() {
  // Button click active class
  for (var i = 0; i < sectBtn.length; i++) {
    sectBtn[i].addEventListener('click', function () {
      var currentBtn = document.querySelectorAll('.active-btn');
      currentBtn[0].className = currentBtn[0].className.replace('active-btn', '');
      this.className += ' active-btn';
    });
  } //Sections Active Class


  allSections.addEventListener('click', function (e) {
    var id = e.target.dataset.id;

    if (id) {
      //remove selected from the other btns
      sectBtns.forEach(function (btn) {
        btn.classList.remove('active');
      });
      e.target.classList.add('active-btn'); // hide other sections

      sections.forEach(function (section) {
        section.classList.remove('active');
      });
      var element = document.getElementById(id);
      element.classList.add('active');
    }
  }); //Toogle theme

  var themeBtn = document.querySelector('.theme-btn');
  themeBtn.addEventListener('click', function () {
    var element = document.body;
    element.classList.toggle('light-mode');
  });
}

var onloadCallback = function onloadCallback() {
  alert("grecaptcha is ready!");
};

PageTransitions();