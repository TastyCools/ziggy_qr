// Function to detect browser language
function getBrowserLanguage() {
    const lang = navigator.language || navigator.userLanguage;
    // Check if it's French (fr, fr-FR, fr-CA, etc.)
    if (lang.toLowerCase().startsWith('fr')) {
        return 'fr';
    }
    // Default to English
    return 'en';
}

// Function to apply translations
function applyTranslations(language) {
    const elements = document.querySelectorAll('[data-localize]');
    const langTranslations = translations[language] || translations['en'];
    
    elements.forEach(element => {
        const key = element.getAttribute('data-localize');
        if (langTranslations[key]) {
            element.innerHTML = langTranslations[key];
        }
    });
    
    // Update the html lang attribute
    document.documentElement.lang = language;
}

// Initialize localization when page loads
document.addEventListener('DOMContentLoaded', function() {
    const browserLang = getBrowserLanguage();
    applyTranslations(browserLang);
}); 