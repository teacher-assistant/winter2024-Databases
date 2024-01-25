<template>
    <div class="bg-warning rounded">
      <div class="d-grid gap-3 rounded shadow-lg">
        <div class="px-3 px-lg-5 px-lg-3 pt-3 pt-lg-5 pt-lg-3">
        	<div v-for="section in sections" class="alert" role="alert" @mouseenter="changeBgColor(section)" @mouseleave="changeBgColor(section)" :class="[section.is_active ? section.class_name : 'alert-dark']">
        		<h1 class="display-1 fw-bold lh-1">
        			{{ section.title }}
        		</h1>
        	</div>
        </div>
        <div class="px-3 px-lg-5 px-lg-3 pb-3 pb-lg-5 pb-lg-3">
        	<Menu />
        </div>
      </div>
    </div>
</template>

<script>
export default {
	props:{
		title:String
	},
	data(){
		return{
			sections:{
				full_name:{
					is_active: false,
					title:"Winter 2024",
					class_name: "alert-primary"
				},
				first_title:{
					is_active: false,
					title:"Databases",
					class_name: "alert-warning"
				},
				second_title:{
					is_active: false,
					title:this.title,
					class_name: "alert-danger"
				}
			}
		}
	},
  	methods:{
  		changeBgColor(section){
	  		section.is_active=!section.is_active
  		}
  	}
}
</script>