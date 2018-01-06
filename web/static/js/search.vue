<template>
    <div class="container">
        <form>
            <div class="form-group">
                <label for="destination">Refrence Address:</label>
                <input type="text"  class="form-control" id="destination" v-model="destination" placeholder="Enter Place where you want to park">
            </div>

            <div class="form-group">
                <button class="btn btn-success" @click="submitSearch" >Submit</button>
            </div>

        </form>

    </div>

</template>

<script >
    import axios from "axios";
    export default {
        data(){
            return{
                destination: null
            }
        },
        methods:{
            submitSearch(){
                axios.get("api/search_parkings", {destination: this.destination})
                    .then(response =>{
                        console.log("response.data");
                    })
                    .catch(error =>{
                        console.log("An error occured", error);
                    })
            }
        }
    }

</script>


