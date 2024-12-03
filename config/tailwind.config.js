const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: "class",
  important: true,

  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    container: {
      center: true, // To center containers by default
    },
    extend: {
      ...require('@anthony0030/bootwind/theme'),

      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      content: {
        empty: "\"\"", //* ""
        space: "\" \"", //* " "
        asterisk: "\"*\"", //* "*"
      },
    },
  },
  plugins: [
    require('@anthony0030/bootwind'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
  safelist: [
    'pagy',
  ],
}
