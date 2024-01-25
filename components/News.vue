<template>
	<div>
		<div class="alert alert-dark">
			<h3 class="alert-head">
				<img src="https://img.icons8.com/bubbles/1000/news.png" class="ico icon" />
				News
			</h3>
			<div :class="getClass(index)" v-for="(news, index) in news_list">
				<div class="d-flex justify-content-between">
					<span v-html="news.body"></span>
					<span>
						{{ news.date }}
					</span>
				</div>
			</div>
		</div>
	</div>
</template>

<style>
.icon{
	width: 70px;
	height: 70px;
}
</style>

<script>
export default {
	data(){
		return{
			classes:[
				'alert alert-info',
				'alert alert-primary',
				'alert alert-success',
				'alert alert-warning'
			],
			news_list:[]
		}
	},
	methods:{
		getClass(index){
			return this.classes[index%this.classes.length]
		}
	},
	mounted() {
	    this.$nextTick(()=>{
		  	this.$axios.$get('https://teacher-assistant.github.io/winter2024-Databases/News.json')
	        .then(response=>this.news_list=response)
	    })
  	}
}
</script>