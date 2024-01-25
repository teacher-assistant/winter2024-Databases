<template>
	<div>
		<div class="alert alert-dark">
			<div v-if="sessions.future.length">
				<h3 class="alert-head">
					<img src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/1000/external-future-morning-flaticons-lineal-color-flat-icons.png" class="ic icon" />
					Future Sessions
				</h3>
				<div class="alert alert-warning d-flex justify-content-between">
					<h5 class="alert-link">
						<img src="https://img.icons8.com/bubbles/1000/topic.png" class="ic icon-3" />
						Topic
					</h5>
					<h5 class="alert-link">
						<img src="https://img.icons8.com/bubbles/1000/overtime.png" class="ic icon-3" />
						Date | Time
					</h5>
				</div>
				<div :class="getClass(session)" v-for="session in sessions.future">
					<div class="d-flex justify-content-between" v-if="session">
						<span>
							{{ session.topic }}
						</span>
						<span>
							{{ session.date }} | {{ session.time.hour }}:{{ session.time.minute }}
						</span>
					</div>
				</div>
			</div>
			<div v-if="sessions.passed.length">
				<h3 class="alert-head">
					<img src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/1000/external-past-morning-flaticons-lineal-color-flat-icons.png" class="ic icon" />
					Passed Sessions
				</h3>
				<div class="alert alert-warning d-flex justify-content-between">
					<h5 class="alert-link">
						<img src="https://img.icons8.com/bubbles/1000/topic.png" class="ic icon-3" />
						Topic
					</h5>
					<h5 class="alert-link">
						<img src="https://img.icons8.com/bubbles/1000/overtime.png" class="ic icon-3" />
						Date | Time
					</h5>
				</div>
				<div :class="getClass(session)" v-for="session in sessions.passed">
					<div class="d-flex justify-content-between" v-if="session">
						<a v-if="session.link" :href="session.link" class="link-danger">
								{{ session.topic }}	
						</a>
						<span v-else>
							{{ session.topic }}	
						</span>
						<span>
							{{ session.date }} | {{ session.time.hour }}:{{ session.time.minute }}
						</span>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center" v-if="!sessions.future.length & !sessions.passed.length">
				<h2 class="alert-link">
					No session has been scheduled yet !
				</h2>
			</div>
		</div>
	</div>
</template>

<style>
.icon-3{
	width: 60px;
	height: 60px;
}
</style>

<script>
export default {
	data(){
		return{
			classes:[
				'alert alert-success',
				'alert alert-danger'
			],
			sessions:{
				'passed':[],
				'future':[]
			}
		}
	},
	methods:{
		getClass(session){
			let now=Date.now()
			let session_time=new Date(session.date).setHours(session.time.hour, session.time.minute)
			return (session_time>now)?this.classes[0]:this.classes[1]
		}
	},
	mounted() {
	    this.$nextTick(()=>{
		  	this.$axios.$get('https://teacher-assistant.github.io/winter2024-Databases/Sessions.json')
	        .then(response=>{
	        	response.forEach((session)=>{
	        		let now=Date.now()
					let session_time=new Date(session.date).setHours(session.time.hour, session.time.minute)
	        		if (session_time>now)
	        			this.sessions.future.push(session)
	        		else
	        			this.sessions.passed.push(session)
	        	});
	        })
	    })
  	}
}
</script>