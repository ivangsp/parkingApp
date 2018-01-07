<template>
    <div class="container">

        <table v-if="response != null" class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Street Address</th>
                <th>Price per Hour</th>
                <th>Free Lots</th>
                <th>Distance</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="item in response">
                <td>{{item.name}}</td>
                <td>{{item.cost}}</td>
                <td>{{item.spaces}}</td>
                <td>{{item.distance}}</td>
            </tr>
            </tbody>
        </table>

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
                destination: null,
                response: null
            }
        },
        methods:{
            submitSearch(){
                axios.post("api/search_parkings", {destination: this.destination})
                    .then(response =>{
                        this.response = response.data.parkings;

                    })
                    .catch(error =>{
                        console.log("An error occured", error);
                    })
            }
        }
    }

</script>


