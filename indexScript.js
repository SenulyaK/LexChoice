// Initialize AOS
AOS.init({
    duration: 1000,
    once: true
});

// Mobile menu functionality
const hamburger = document.querySelector('.hamburger');
const navLinks = document.querySelector('.nav-links');

hamburger.addEventListener('click', () => {
    navLinks.classList.toggle('active');
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

const slides = document.querySelectorAll('.feature-slide');
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
