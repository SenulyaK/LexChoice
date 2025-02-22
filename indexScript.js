// Initialize AOS
AOS.init({
    duration: 1000,
    once: true
});

// Mobile menu functionality
document.addEventListener('DOMContentLoaded', function() {
  const hamburger = document.querySelector('.hamburger');
  const navLinks = document.querySelector('.nav-links');

  hamburger.addEventListener('click', () => {
    navLinks.classList.toggle('active');
  });

  document.querySelectorAll('.nav-links a').forEach(link => {
    link.addEventListener('click', () => {
      navLinks.classList.remove('active');
    });
  });
});

document.addEventListener("DOMContentLoaded", function() {
  const sections = document.querySelectorAll("section");
  const navLinks = document.querySelectorAll(".nav-links a");

  window.addEventListener("scroll", function() {
      let current = "";

      sections.forEach(section => {
          const sectionTop = section.offsetTop - 100;
          if (window.scrollY >= sectionTop) {
              current = section.getAttribute("id");
          }
      });

      navLinks.forEach(link => {
          link.classList.remove("active");
          if (link.getAttribute("href").includes(current)) {
              link.classList.add("active");
          }
      });
  });
});

// Smooth scrolling
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});

let lastScrollTop = 0;
const header = document.querySelector('.header');

window.addEventListener('scroll', () => {
  const currentScroll = window.pageYOffset || document.documentElement.scrollTop;
  
  // If scrolling down and scrolled more than 100px, hide navbar
  if (currentScroll > lastScrollTop && currentScroll > 100) {
    header.classList.add('nav-hidden');
  } else {
    header.classList.remove('nav-hidden');
  }
  
  // Update lastScrollTop (make sure it's never negative)
  lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
});

/*const slides = document.querySelectorAll('.feature-slide');
let currentSlide = 0;
let autoPlayInterval;

// Function to update classes on slides based on current index
function updateSlides() {
  slides.forEach((slide, index) => {
    slide.classList.remove('active', 'next', 'prev');
    if (index === currentSlide) {
      slide.classList.add('active');
    } else if (index === (currentSlide + 1) % slides.length) {
      slide.classList.add('next');
    } else if (index === (currentSlide - 1 + slides.length) % slides.length) {
      slide.classList.add('prev');
    }
    // Other slides remain with the base styling (blurred in the background)
  });
}*/

const slides = document.querySelectorAll('.feature-slide');
let currentSlide = 0;
let autoPlayInterval;

// Update slide classes for circular carousel
function updateSlides() {
  slides.forEach((slide, index) => {
    slide.classList.remove('active', 'next', 'prev');
    if (index === currentSlide) {
      slide.classList.add('active');
    } else if (index === (currentSlide + 1) % slides.length) {
      slide.classList.add('next');
    } else if (index === (currentSlide - 1 + slides.length) % slides.length) {
      slide.classList.add('prev');
    }
  });
  adjustCarouselHeight();
}

// Adjust carousel container height to match active slide's total height
function adjustCarouselHeight() {
  const activeSlide = document.querySelector('.feature-slide.active');
  if (activeSlide) {
    // Measure the full height of the slide content
    const contentHeight = activeSlide.querySelector('.slide-content').offsetHeight;
    document.querySelector('.features-carousel').style.height = contentHeight + 'px';
  }
}


// Move to the next slide
function nextSlide() {
  currentSlide = (currentSlide + 1) % slides.length;
  updateSlides();
}

// Move to the previous slide
function prevSlide() {
  currentSlide = (currentSlide - 1 + slides.length) % slides.length;
  updateSlides();
}

// Event listeners for arrow buttons
document.getElementById('nextBtn').addEventListener('click', () => {
  stopAutoPlay();
  nextSlide();
  startAutoPlay();
});

document.getElementById('prevBtn').addEventListener('click', () => {
  stopAutoPlay();
  prevSlide();
  startAutoPlay();
});

// Auto-play functions: change slide every 5 seconds
function startAutoPlay() {
  autoPlayInterval = setInterval(nextSlide, 5000);
}

function stopAutoPlay() {
  clearInterval(autoPlayInterval);
}

// Initialize slides and start auto-play
updateSlides();
startAutoPlay();

