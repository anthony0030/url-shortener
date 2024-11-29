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
    extend: {
      ...require('@anthony0030/bootwind/theme'),
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('@anthony0030/bootwind'),
  ]
}
