import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ "button" ]

  initialize() {
    var local_theme = localStorage.getItem('theme') || 'theme-light';
    this.setTheme(local_theme);
  }

  changeTo(event) {
    var selectedTheme = event.target.getAttribute('data-theme');
    this.setTheme(selectedTheme);
    localStorage.setItem('theme', selectedTheme);
  }

  setTheme(theme) {
     document.body.className = document.body.className.replace(/theme-\w+/, theme);
  }

}
