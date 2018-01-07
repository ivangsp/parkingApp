import Vue from "vue";
import VueRouter from "vue-router";
import axios from "axios";

import Main from "./main";


Vue.use(VueRouter);


var router = new VueRouter({
    routes: [
        { path: '/', component: Main}
    ]
});

new Vue({
    router
}).$mount("#parking-app");