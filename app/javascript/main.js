document.addEventListener('DOMContentLoaded', function() {
  const main = new Main();
});

class Main {
  constructor() {
    this.header = document.querySelector('.header');
    this._observer = [];
    this._init();
  }

  set observers(val) {
    this._observer.push(val);
  }

  get observers() {
    return this._observer;
  }

  _navAnimation(el, inview) {
    if(inview) {
      this.header.classList.remove('triggered');
    } else {
      this.header.classList.add('triggered');
    }
  }

  _scrollInit() {
    this.observers = new ScrollObserver('.nav-trigger', this._navAnimation.bind(this), {once: false});
  }

}