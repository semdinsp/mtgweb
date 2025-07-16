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
            }
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
              "secondary": "rgb(255, 127, 8)", 
              "accent": "rgb(255, 127, 8)",
              "neutral": "rgb(5, 5, 5)",
              "base-100": "rgb(29, 9, 89)",
              "base-200": "rgb(24, 7, 74)",
              "base-300": "rgb(19, 5, 59)",
              "base-content": "rgb(255, 255, 255)",
            },
          },
        ],
      },
    };
