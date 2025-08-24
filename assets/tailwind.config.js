const defaultTheme = require('tailwindcss/defaultTheme')
  module.exports = {
      content: [               
        './js/**/*.js',        
        '../lib/*_web.ex',   
        '../lib/*_web/**/*.*ex'
      ],
      theme: {
        extend: {
          fontFamily: {
            sans: ['Inter', 'Inter Tight', ...defaultTheme.fontFamily.sans],
            display: ['Inter Display', 'Inter', ...defaultTheme.fontFamily.sans],
            serif: ['Playfair Display', ...defaultTheme.fontFamily.serif],
            satoshi: ['Satoshi', 'Inter', ...defaultTheme.fontFamily.sans],
          },
          colors: {
            'mtg': {
              'purple': 'rgb(29, 9, 89)',
              'orange': 'rgb(255, 127, 8)',
              'white': 'rgb(255, 255, 255)',
              'dark': 'rgb(5, 5, 5)',
            },
            'brand': 'rgb(29, 9, 89)',
          }
        }
      },
      variants: {},
      plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/aspect-ratio'),
        require('daisyui')
      ],
      daisyui: {
        themes: [
          {
            mtg: {
              "primary": "rgb(29, 9, 89)",
              "primary-focus": "rgb(24, 7, 74)",
              "primary-content": "rgb(255, 255, 255)",
              "secondary": "rgb(255, 127, 8)", 
              "secondary-focus": "rgb(230, 102, 0)",
              "secondary-content": "rgb(255, 255, 255)",
              "accent": "rgb(255, 127, 8)",
              "accent-focus": "rgb(230, 102, 0)",
              "accent-content": "rgb(255, 255, 255)",
              "neutral": "rgb(5, 5, 5)",
              "neutral-focus": "rgb(15, 15, 15)",
              "neutral-content": "rgb(255, 255, 255)",
              "base-100": "rgb(29, 9, 89)",
              "base-200": "rgb(24, 7, 74)",
              "base-300": "rgb(19, 5, 59)",
              "base-content": "rgb(255, 255, 255)",
              // Custom semantic colors
              "brand": "rgb(29, 9, 89)",
              "brand-light": "rgb(39, 19, 99)",
              "brand-dark": "rgb(19, 5, 59)",
              "brand-text": "rgb(29, 9, 89)",
              "surface": "rgb(24, 7, 74)",
              "card": "rgb(24, 7, 74)",
            },
          },
        ],
      },
    };
