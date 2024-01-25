<template>
	<nav class="navbar center navbar-expand-lg navbar-dark bg-dark rounded">
	  <div class="collapse navbar-collapse d-flex justify-content-center" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item" v-for="section in sections">
	        <NuxtLink class="nav-link d-flex align-items-center gap-1" :to="section.to">
	        	<img :src="section.image" class="ico icon-4" />
	        	{{ section.text }}
	        </NuxtLink >
	      </li>
	    </ul>
	  </div>
	</nav>
</template>

<style>
.icon-4{
	width: 50px;
	height: 50px;
}
</style>

<script>
export default {
	data(){
		return{
			sections:[
				{
					'to':'/',
					'icon':'book-reader',
					'text':'Home page',
					'image':'https://img.icons8.com/bubbles/1000/home-page.png'
				}
			]
		}
	}
}
</script>