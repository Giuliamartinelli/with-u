let app = new EmberApp(defaults, {
  autoImport: {
    alias: {
      // when the app tries to import from "plotly.js", use
      // the real package "plotly.js-basic-dist" instead.
      'plotly.js': 'plotly.js-basic-dist',

      // you can also use aliases to pick a different entrypoint
      // within the same package. This can come up when the default
      // entrypoint only works in Node, but there is also a browser
      // build available (and the author didn't provide a "browser"
      // field in package.json that would let us detect it
      // automatically).
      'handlebars': 'handlebars/dist/handlebars'
    },
    exclude: ['some-package'],
    skipBabel: [{
      // when an already babel transpiled addons like "mapbox-gl" is
      // not skipped, it can produce errors in the production mode
      // due to double transpilation
      package: 'mapbox-gl',
      semverRange: '*'
    }, {
      // list can continue
    }],
    webpack: {
      // extra webpack configuration goes here
    }
  }
});
