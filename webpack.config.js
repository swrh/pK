var path = require('path');

const production = {
    entry: './src/main/js/index.js',
    mode: 'production',
    output: {
        path: __dirname,
        filename: './src/main/resources/static/built/bundle.js'
    },
    module: {
        rules: [
            {
                test: path.join(__dirname, '.'),
                exclude: /(node_modules)/,
                use: [{
                    loader: 'babel-loader',
                    options: {
                        presets: [
                            '@babel/preset-env',
                            '@babel/preset-react',
                        ]
                    }
                }]
            }
        ]
    }
};

const development = {
    ...production,
    devtool: 'source-map',
    mode: 'development',
    output: {
        path: __dirname,
        filename: './target/classes/static/built/bundle.js',
    },
}

module.exports = (env) => {
    return env.production ? production : development;
}
