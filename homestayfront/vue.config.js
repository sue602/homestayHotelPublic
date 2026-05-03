// 跨域配置
const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
    transpileDependencies: true,
    lintOnSave: false,
    chainWebpack: config => {
        config.plugins.delete('fork-ts-checker')
    },
    devServer: {
        port: 8092, // 前端端口（后端占用8090，需错开）
        proxy: {
            '/api': {  //   若请求的前缀不是这个'/api'，那请求就不会走代理服务器
                target: 'http://localhost:8090',  //这里写路径 如：http://172.31.103.131:8091
                pathRewrite:{'^/api':''}, //将所有含/api路径的，去掉/api转发给服务器
                ws: true,  //用于支持websocket
                changeOrigin: true   //用于控制请求头中的host值
            },
        }
    }
})

