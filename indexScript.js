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

const backToTop = document.getElementById('backToTop');

// Show button when scrolling down
window.addEventListener('scroll', () => {
    if (window.scrollY > 300) {
        backToTop.classList.add('visible');
    } else {
        backToTop.classList.remove('visible');
    }
});

// Smooth scroll to top when clicked
backToTop.addEventListener('click', (e) => {
    e.preventDefault();
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

document.addEventListener('DOMContentLoaded', function() {
  // Structure updates - wrap all content after hero in a content wrapper
  const heroSection = document.querySelector('.hero');
  const allContentAfterHero = Array.from(document.body.children).filter(el => {
    return el !== heroSection && el.tagName.toLowerCase() !== 'header' && el.tagName.toLowerCase() !== 'script';
  });
  
  // Create content wrapper
  const contentWrapper = document.createElement('div');
  contentWrapper.className = 'content-wrapper';
  
  // Move all content after hero into the wrapper
  allContentAfterHero.forEach(el => {
    contentWrapper.appendChild(el);
  });
  
  // Insert the wrapper after the hero
  document.body.insertBefore(contentWrapper, heroSection.nextSibling);
  
  // Set hero text content
  const heroTitle = document.querySelector('.hero h1');
  const heroSubtitle = document.querySelector('.hero h2');
  
  heroTitle.textContent = 'LexChoice';
  heroSubtitle.innerHTML = '<i>Empowering Kids with Legal Knowledge Through Fun</i>';
  
  // Create animated background patterns
  const animatedBg = document.createElement('div');
  animatedBg.className = 'animated-bg';
  heroSection.appendChild(animatedBg);
  
  // Create floating legal icons
  const iconContainer = document.createElement('div');
  iconContainer.className = 'floating-icons';
  
  // Legal-themed icons from Font Awesome
  const icons = [
    'fa-solid fa-scale-balanced',
    'fa-solid fa-gavel',
    'fa-solid fa-book',
    'fa-solid fa-shield',
    'fa-solid fa-graduation-cap',
    'fa-solid fa-gamepad',
    'fa-solid fa-landmark',
    'fa-solid fa-laptop-code',
    'fa-solid fa-trophy',
    'fa-solid fa-school',
    'fa-solid fa-user-shield',
    'fa-solid fa-children',
    'fa-solid fa-road',
    'fa-solid fa-paragraph',
    'fa-solid fa-universal-access'
  ];
  
  // Create 20 random icons with staggered animation
  for (let i = 0; i < 20; i++) {
    createFloatingIcon(iconContainer, icons, i);
  }
  
  // Add highlight bubbles
  for (let i = 0; i < 5; i++) {
    createHighlightBubble(heroSection);
  }
   
  // Add skip button
  const skipButton = document.createElement('button');
  skipButton.className = 'skip-hero';
  skipButton.textContent = 'Get Started';
  skipButton.addEventListener('click', function() {
    contentWrapper.scrollIntoView({ behavior: 'smooth' });
  });
  heroSection.appendChild(skipButton);
  
  // Add icons to hero section
  heroSection.appendChild(iconContainer);
  
  // Auto-scroll functionality
  setTimeout(() => {
    // Add scroll event listener to hide fixed hero when scrolling down
    window.addEventListener('scroll', function() {
      const scrollPosition = window.scrollY;
      if (scrollPosition > 100) {
        heroSection.style.opacity = Math.max(0, 1 - scrollPosition / window.innerHeight);
      } else {
        heroSection.style.opacity = 1;
      }
      
      // Disable hero when fully scrolled past
      if (scrollPosition > window.innerHeight) {
        heroSection.style.pointerEvents = 'none';
      } else {
        heroSection.style.pointerEvents = 'auto';
      }
    });
  }, 3000);
});

function createFloatingIcon(container, iconClasses, index) {
  const icon = document.createElement('i');
  
  // Random icon class
  const randomIcon = iconClasses[Math.floor(Math.random() * iconClasses.length)];
  icon.className = `icon ${randomIcon}`;
  
  // Random starting position
  const left = Math.random() * 100;
  icon.style.left = `${left}%`;
  
  // Random movement pattern
  const randX = Math.random() * 2 - 1; // value between -1 and 1
  icon.style.setProperty('--rand-x', randX);
  
  // Random size
  const size = Math.random() * 2 + 1.2;
  icon.style.fontSize = `${size}rem`;
  
  // Random animation duration
  const duration = Math.random() * 10 + 15;
  icon.style.animationDuration = `${duration}s`;
  
  // Random delay
  const delay = Math.random() * 12;
  icon.style.animationDelay = `${delay}s`;
  
  // Parallax data attribute
  icon.setAttribute('data-speed', (Math.random() * 0.05 + 0.02).toFixed(3));
  
  container.appendChild(icon);
}

function createHighlightBubble(container) {
  const bubble = document.createElement('div');
  bubble.className = 'highlight-bubble';
  
  // Random position
  const left = Math.random() * 90 + 5;
  const top = Math.random() * 90 + 5;
  bubble.style.left = `${left}%`;
  bubble.style.top = `${top}%`;
  
  // Random size
  const size = Math.random() * 200 + 100;
  bubble.style.width = `${size}px`;
  bubble.style.height = `${size}px`;
  
  // Random animation duration and delay
  const duration = Math.random() * 5 + 8;
  const delay = Math.random() * 10;
  bubble.style.animationDuration = `${duration}s`;
  bubble.style.animationDelay = `${delay}s`;
  
  container.appendChild(bubble);
}

// FAQ Accordion functionality
document.addEventListener('DOMContentLoaded', function() {
  const faqItems = document.querySelectorAll('.faq-item');
  
  faqItems.forEach(item => {
    const question = item.querySelector('.faq-question');
    
    question.addEventListener('click', () => {
      // Toggle active class on the clicked item
      item.classList.toggle('active');
      
      // Optional: Close other items when one is opened
      faqItems.forEach(otherItem => {
        if (otherItem !== item && otherItem.classList.contains('active')) {
          otherItem.classList.remove('active');
        }
      });
    });
  });
});