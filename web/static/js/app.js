import Vue from "vue";
import VueRouter from "vue-router";
import axios from "axios";

import SearchForm from "./search";


Vue.use(VueRouter);


var router = new VueRouter({
    routes: [
        { path: '/', component: SearchForm}
    ]
});

new Vue({
    router
}).$mount("#parking-app");